// Copyright 2024 International Digital Economy Academy
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

let max_val = 2147483647

let min_val = -2147483648

pub fn Int::from_int(i : Int) -> Int {
  i
}

pub fn abs(self : Int) -> Int {
  if self < 0 {
    -self
  } else {
    self
  }
}

pub fn signum(self : Int) -> Int {
  if self < 0 {
    -1
  } else if self > 0 {
    1
  } else {
    0
  }
}

// Returns the largest positive finite value of Int
pub fn Int::max_value() -> Int {
  max_val
}

// Returns the smallest positive nonzero value of Int
pub fn Int::min_value() -> Int {
  min_val
}

fn test_num[T : @num.Num + Debug + Default + Eq](
  x : T,
  y : T,
  x_plus_y : T,
  x_mul_y : T,
  x_minus_y : T,
  x_div_y : T,
  x_signum : T
) -> Result[Unit, String] {
  @assertion.assert_eq(x + y, x_plus_y)?
  @assertion.assert_eq(x * y, x_mul_y)?
  @assertion.assert_eq(x - y, x_minus_y)?
  @assertion.assert_eq(x / y, x_div_y)?
  @assertion.assert_eq(x.abs(), T::default() - x)?
  @assertion.assert_eq(x.signum(), x_signum)?
  Ok(())
}

test "int.num" {
  let x = -5
  let y = 7
  test_num(x, y, x + y, x * y, x - y, x / y, -1)?
}
