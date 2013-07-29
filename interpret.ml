open Ast

module NameMap = Map.Make(struct
	type t = string
	let compare x y = Pervasives.compare x y
end)

exception ReturnException of int * int NameMap.t