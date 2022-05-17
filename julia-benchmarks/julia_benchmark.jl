using BenchmarkTools, StatsBase


fn0() = ccall(
    (:fn0, "./libbenchmark.so"), Int64, ()
);
fn1(x) = ccall(
    (:fn1, "./libbenchmark.so"), Int64, (Int64,), x
);
fn2(x, y) = ccall(
    (:fn2, "./libbenchmark.so"), Float64, (Int64, Float64), x, y
);
fn3(x, y, s) = unsafe_string(ccall(
    (:fn3, "./libbenchmark.so"), Cstring, (Int64, Float64, Cstring), x, y, s
));
fn3a(x, y, s) = ccall(
    (:fn3, "./libbenchmark.so"), Cstring, (Int64, Float64, Cstring), x, y, s
);

println(fn0())
println(fn1(2))
println(fn2(3, 4.0))
println(fn3(5, 6.0, "hello"))


t = @benchmark fn0()
m = mean(t).time
s = std(t).time
println("($(m), $(s), $(m/s))")

t = @benchmark fn1(x) setup=(x=1)
m = mean(t).time
s = std(t).time
println("($(m), $(s), $(m/s))")

t = @benchmark fn2(x, y) setup=(x=1;y=2.0)
m = mean(t).time
s = std(t).time
println("($(m), $(s), $(m/s))")

t = @benchmark fn3(x, y, s) setup=(x=1;y=2.0;s="hello")
m = mean(t).time
s = std(t).time
println("($(m), $(s), $(m/s))")

println(dump(t))

t = @benchmark fn3a(x, y, s) setup=(x=1;y=2.0;s="hello")
m = mean(t).time
s = std(t).time
println("($(m), $(s), $(m/s))")