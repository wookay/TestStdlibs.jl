using Jive
@useinside Main module test_distributed_addprocs

using Test
using Distributed

@test nprocs() == 1

ws = addprocs(1)
wid = first(ws)
w = Distributed.worker_from_id(wid)
@test wid == worker_id_from_socket(w.w_stream)
@test wid == worker_id_from_socket(w.r_stream)
@test Distributed.map_sock_wrkr[w.r_stream] === w

using .Distributed: Worker, MsgHeader, CallMsg, send_msg
function myremotecall(f, w::Worker, args...; kwargs...)
    rr = Future(w)
    send_msg(w, MsgHeader(remoteref_id(rr)), CallMsg{:call}(f, args, kwargs))
    return rr
end
@test (fetch ∘ myremotecall)(() -> myid(), w) == wid

t = rmprocs(wid)
wait(t)

@test nprocs() == 1

end # module test_distributed_addprocs
