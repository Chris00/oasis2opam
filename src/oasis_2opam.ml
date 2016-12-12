(***************************************************************************)
(*  OASIS2OPAM: Convert OASIS metadata to OPAM package descriptions        *)
(*                                                                         *)
(*  Copyright (C) 2013-2015, Christophe Troestler                          *)
(*                                                                         *)
(*  This library is free software; you can redistribute it and/or modify   *)
(*  it under the terms of the GNU General Public License as published by   *)
(*  the Free Software Foundation; either version 3 of the License, or (at  *)
(*  your option) any later version, with the OCaml static compilation      *)
(*  exception.                                                             *)
(*                                                                         *)
(*  This library is distributed in the hope that it will be useful, but    *)
(*  WITHOUT ANY WARRANTY; without even the implied warranty of             *)
(*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the file      *)
(*  COPYING for more details.                                              *)
(*                                                                         *)
(*  You should have received a copy of the GNU Lesser General Public       *)
(*  License along with this library; if not, write to the Free Software    *)
(*  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301   *)
(*  USA.                                                                   *)
(***************************************************************************)

(** Plugin for "oasis" *)

open OASISGettext

let () =
  let usage_msg = ns_ "oasis 2opam <url or tarball>" in
  let fspecs () = Oasis2opam.fspecs usage_msg in
  CLISubCommand.register
    ~usage:usage_msg
    "2opam"
    (* synopsis *) "Generate OPAM package description from _oasis"
    (* help *)
    "This command generates OPAM files with _oasis.  Most of the\n\
     metadata supported by oasis is translated to OPAM.  A simple\n\
     .install file is written to preserve Oasis setup.{ml,data,log} in\n\
     order to be able to use oasis for removal."
    (CLISubCommand.make_run fspecs
       (fun ~ctxt:_ s -> Oasis2opam.run s))
