(define (problem depot-13-2-2-17-15-4) (:domain depots)
(:objects
	depot0 depot1 depot2 depot3 depot4 depot5 depot6 depot7 depot8 depot9 depot10 depot11 depot12 - Depot
	distributor0 distributor1 - Distributor
	truck0 truck1 - Truck
	pallet0 pallet1 pallet2 pallet3 pallet4 pallet5 pallet6 pallet7 pallet8 pallet9 pallet10 pallet11 pallet12 pallet13 pallet14 pallet15 pallet16 - Pallet
	crate0 crate1 crate2 crate3 - Crate
	hoist0 hoist1 hoist2 hoist3 hoist4 hoist5 hoist6 hoist7 hoist8 hoist9 hoist10 hoist11 hoist12 hoist13 hoist14 - Hoist)
(:init
	(at pallet0 depot0)
	(clear pallet0)
	(at pallet1 depot1)
	(clear pallet1)
	(at pallet2 depot2)
	(clear pallet2)
	(at pallet3 depot3)
	(clear pallet3)
	(at pallet4 depot4)
	(clear pallet4)
	(at pallet5 depot5)
	(clear crate2)
	(at pallet6 depot6)
	(clear pallet6)
	(at pallet7 depot7)
	(clear crate3)
	(at pallet8 depot8)
	(clear pallet8)
	(at pallet9 depot9)
	(clear pallet9)
	(at pallet10 depot10)
	(clear crate1)
	(at pallet11 depot11)
	(clear pallet11)
	(at pallet12 depot12)
	(clear pallet12)
	(at pallet13 distributor0)
	(clear pallet13)
	(at pallet14 distributor1)
	(clear crate0)
	(at pallet15 distributor1)
	(clear pallet15)
	(at pallet16 depot4)
	(clear pallet16)
	(at truck0 depot1)
	(at truck1 distributor1)
	(at hoist0 depot0)
	(available hoist0)
	(at hoist1 depot1)
	(available hoist1)
	(at hoist2 depot2)
	(available hoist2)
	(at hoist3 depot3)
	(available hoist3)
	(at hoist4 depot4)
	(available hoist4)
	(at hoist5 depot5)
	(available hoist5)
	(at hoist6 depot6)
	(available hoist6)
	(at hoist7 depot7)
	(available hoist7)
	(at hoist8 depot8)
	(available hoist8)
	(at hoist9 depot9)
	(available hoist9)
	(at hoist10 depot10)
	(available hoist10)
	(at hoist11 depot11)
	(available hoist11)
	(at hoist12 depot12)
	(available hoist12)
	(at hoist13 distributor0)
	(available hoist13)
	(at hoist14 distributor1)
	(available hoist14)
	(at crate0 distributor1)
	(on crate0 pallet14)
	(at crate1 depot10)
	(on crate1 pallet10)
	(at crate2 depot5)
	(on crate2 pallet5)
	(at crate3 depot7)
	(on crate3 pallet7)
)

(:goal (and
		(on crate0 pallet5)
		(on crate1 pallet13)
		(on crate2 pallet12)
		(on crate3 crate1)
	)
))
