(define (problem transport-generated)
	(:domain transport)
(:objects
	p_0_0 p_0_1 p_0_2 p_0_3 p_0_4 p_0_5 p_0_6 p_1_0 p_1_1 p_1_2 p_1_3 p_1_4 p_1_5 p_1_6 p_2_0 p_2_1 p_2_2 p_2_3 p_2_4 p_2_5 p_2_6 p_3_0 p_3_1 p_3_2 p_3_3 p_3_4 p_3_5 p_3_6 p_4_0 p_4_1 p_4_2 p_4_3 p_4_4 p_4_5 p_4_6 - place
	b0 b1 b2 b3 b4 b5 b6 - box
	t0 - truck
	f0 - fuel
	f1 - fuel
	f2 - fuel
	f3 - fuel
	f4 - fuel
	f5 - fuel
	f6 - fuel
	f7 - fuel
	f8 - fuel
	f9 - fuel
	f10 - fuel
	f11 - fuel
	f12 - fuel
	f13 - fuel
	f14 - fuel
	f15 - fuel
	f16 - fuel
	f17 - fuel
	f18 - fuel
	f19 - fuel
	f20 - fuel
	f21 - fuel
	f22 - fuel
	f23 - fuel
	f24 - fuel
	f25 - fuel
	f26 - fuel
	f27 - fuel
	f28 - fuel
	f29 - fuel
	f30 - fuel
	f31 - fuel
	f32 - fuel
	f33 - fuel
	f34 - fuel
	f35 - fuel
	f36 - fuel
	f37 - fuel
	f38 - fuel
	f39 - fuel
	f40 - fuel
	f41 - fuel
	f42 - fuel
	f43 - fuel
	f44 - fuel
	f45 - fuel
	f46 - fuel
	f47 - fuel
	f48 - fuel
	f49 - fuel
	f50 - fuel
	f51 - fuel
	f52 - fuel
	f53 - fuel
	f54 - fuel
	f55 - fuel
	f56 - fuel
	f57 - fuel
	f58 - fuel
	f59 - fuel
	f60 - fuel
	f61 - fuel
	f62 - fuel
	f63 - fuel
	f64 - fuel
	f65 - fuel
	f66 - fuel
	f67 - fuel
	f68 - fuel
)

(:init
	(connected p_0_0 p_1_0)
	(connected p_0_0 p_0_1)
	(connected p_0_1 p_1_1)
	(connected p_0_1 p_0_0)
	(connected p_0_1 p_0_2)
	(connected p_0_2 p_1_2)
	(connected p_0_2 p_0_1)
	(connected p_0_2 p_0_3)
	(connected p_0_3 p_1_3)
	(connected p_0_3 p_0_2)
	(connected p_0_3 p_0_4)
	(connected p_0_4 p_1_4)
	(connected p_0_4 p_0_3)
	(connected p_0_4 p_0_5)
	(connected p_0_5 p_1_5)
	(connected p_0_5 p_0_4)
	(connected p_0_5 p_0_6)
	(connected p_0_6 p_1_6)
	(connected p_0_6 p_0_5)
	(connected p_1_0 p_0_0)
	(connected p_1_0 p_2_0)
	(connected p_1_0 p_1_1)
	(connected p_1_1 p_0_1)
	(connected p_1_1 p_2_1)
	(connected p_1_1 p_1_0)
	(connected p_1_1 p_1_2)
	(connected p_1_2 p_0_2)
	(connected p_1_2 p_2_2)
	(connected p_1_2 p_1_1)
	(connected p_1_2 p_1_3)
	(connected p_1_3 p_0_3)
	(connected p_1_3 p_2_3)
	(connected p_1_3 p_1_2)
	(connected p_1_3 p_1_4)
	(connected p_1_4 p_0_4)
	(connected p_1_4 p_2_4)
	(connected p_1_4 p_1_3)
	(connected p_1_4 p_1_5)
	(connected p_1_5 p_0_5)
	(connected p_1_5 p_2_5)
	(connected p_1_5 p_1_4)
	(connected p_1_5 p_1_6)
	(connected p_1_6 p_0_6)
	(connected p_1_6 p_2_6)
	(connected p_1_6 p_1_5)
	(connected p_2_0 p_1_0)
	(connected p_2_0 p_3_0)
	(connected p_2_0 p_2_1)
	(connected p_2_1 p_1_1)
	(connected p_2_1 p_3_1)
	(connected p_2_1 p_2_0)
	(connected p_2_1 p_2_2)
	(connected p_2_2 p_1_2)
	(connected p_2_2 p_3_2)
	(connected p_2_2 p_2_1)
	(connected p_2_2 p_2_3)
	(connected p_2_3 p_1_3)
	(connected p_2_3 p_3_3)
	(connected p_2_3 p_2_2)
	(connected p_2_3 p_2_4)
	(connected p_2_4 p_1_4)
	(connected p_2_4 p_3_4)
	(connected p_2_4 p_2_3)
	(connected p_2_4 p_2_5)
	(connected p_2_5 p_1_5)
	(connected p_2_5 p_3_5)
	(connected p_2_5 p_2_4)
	(connected p_2_5 p_2_6)
	(connected p_2_6 p_1_6)
	(connected p_2_6 p_3_6)
	(connected p_2_6 p_2_5)
	(connected p_3_0 p_2_0)
	(connected p_3_0 p_4_0)
	(connected p_3_0 p_3_1)
	(connected p_3_1 p_2_1)
	(connected p_3_1 p_4_1)
	(connected p_3_1 p_3_0)
	(connected p_3_1 p_3_2)
	(connected p_3_2 p_2_2)
	(connected p_3_2 p_4_2)
	(connected p_3_2 p_3_1)
	(connected p_3_2 p_3_3)
	(connected p_3_3 p_2_3)
	(connected p_3_3 p_4_3)
	(connected p_3_3 p_3_2)
	(connected p_3_3 p_3_4)
	(connected p_3_4 p_2_4)
	(connected p_3_4 p_4_4)
	(connected p_3_4 p_3_3)
	(connected p_3_4 p_3_5)
	(connected p_3_5 p_2_5)
	(connected p_3_5 p_4_5)
	(connected p_3_5 p_3_4)
	(connected p_3_5 p_3_6)
	(connected p_3_6 p_2_6)
	(connected p_3_6 p_4_6)
	(connected p_3_6 p_3_5)
	(connected p_4_0 p_3_0)
	(connected p_4_0 p_4_1)
	(connected p_4_1 p_3_1)
	(connected p_4_1 p_4_0)
	(connected p_4_1 p_4_2)
	(connected p_4_2 p_3_2)
	(connected p_4_2 p_4_1)
	(connected p_4_2 p_4_3)
	(connected p_4_3 p_3_3)
	(connected p_4_3 p_4_2)
	(connected p_4_3 p_4_4)
	(connected p_4_4 p_3_4)
	(connected p_4_4 p_4_3)
	(connected p_4_4 p_4_5)
	(connected p_4_5 p_3_5)
	(connected p_4_5 p_4_4)
	(connected p_4_5 p_4_6)
	(connected p_4_6 p_3_6)
	(connected p_4_6 p_4_5)
	(at b0 p_2_4)
	(at b1 p_3_5)
	(at b2 p_4_6)
	(at b3 p_4_6)
	(at b4 p_0_6)
	(at b5 p_0_5)
	(at b6 p_4_6)
	(at t0 p_2_3)
	(empty t0)
	(fuel-level t0 f68)
	(fuel-predecessor f0 f1)
	(fuel-predecessor f1 f2)
	(fuel-predecessor f2 f3)
	(fuel-predecessor f3 f4)
	(fuel-predecessor f4 f5)
	(fuel-predecessor f5 f6)
	(fuel-predecessor f6 f7)
	(fuel-predecessor f7 f8)
	(fuel-predecessor f8 f9)
	(fuel-predecessor f9 f10)
	(fuel-predecessor f10 f11)
	(fuel-predecessor f11 f12)
	(fuel-predecessor f12 f13)
	(fuel-predecessor f13 f14)
	(fuel-predecessor f14 f15)
	(fuel-predecessor f15 f16)
	(fuel-predecessor f16 f17)
	(fuel-predecessor f17 f18)
	(fuel-predecessor f18 f19)
	(fuel-predecessor f19 f20)
	(fuel-predecessor f20 f21)
	(fuel-predecessor f21 f22)
	(fuel-predecessor f22 f23)
	(fuel-predecessor f23 f24)
	(fuel-predecessor f24 f25)
	(fuel-predecessor f25 f26)
	(fuel-predecessor f26 f27)
	(fuel-predecessor f27 f28)
	(fuel-predecessor f28 f29)
	(fuel-predecessor f29 f30)
	(fuel-predecessor f30 f31)
	(fuel-predecessor f31 f32)
	(fuel-predecessor f32 f33)
	(fuel-predecessor f33 f34)
	(fuel-predecessor f34 f35)
	(fuel-predecessor f35 f36)
	(fuel-predecessor f36 f37)
	(fuel-predecessor f37 f38)
	(fuel-predecessor f38 f39)
	(fuel-predecessor f39 f40)
	(fuel-predecessor f40 f41)
	(fuel-predecessor f41 f42)
	(fuel-predecessor f42 f43)
	(fuel-predecessor f43 f44)
	(fuel-predecessor f44 f45)
	(fuel-predecessor f45 f46)
	(fuel-predecessor f46 f47)
	(fuel-predecessor f47 f48)
	(fuel-predecessor f48 f49)
	(fuel-predecessor f49 f50)
	(fuel-predecessor f50 f51)
	(fuel-predecessor f51 f52)
	(fuel-predecessor f52 f53)
	(fuel-predecessor f53 f54)
	(fuel-predecessor f54 f55)
	(fuel-predecessor f55 f56)
	(fuel-predecessor f56 f57)
	(fuel-predecessor f57 f58)
	(fuel-predecessor f58 f59)
	(fuel-predecessor f59 f60)
	(fuel-predecessor f60 f61)
	(fuel-predecessor f61 f62)
	(fuel-predecessor f62 f63)
	(fuel-predecessor f63 f64)
	(fuel-predecessor f64 f65)
	(fuel-predecessor f65 f66)
	(fuel-predecessor f66 f67)
	(fuel-predecessor f67 f68)
)

(:goal
	(and
		(at b0 p_4_6)
		(at b1 p_4_6)
		(at b2 p_4_6)
		(at b3 p_4_6)
		(at b4 p_4_6)
		(at b5 p_4_6)
		(at b6 p_4_6)
	)
)
)
