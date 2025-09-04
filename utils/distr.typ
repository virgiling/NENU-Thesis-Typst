#let group-punct(s: str) = {
  let clusters = s.clusters()
  let result = ()
  let punct = regex("[,.:!，。：！]")
  for c in clusters {
    if result.len() > 0 and c.match((punct)) != none {
      result.at(result.len() - 1) = result.at(result.len() - 1) + c
    } else {
      result.push(c)
    }
  }
  result
}

#let distr(s, w: auto) = {
  block(
    width: w,
    stack(
      dir: ltr,
      ..group-punct(s: s).map(x => [#x]).intersperse(1fr),
    ),
  )
}

#let v-distr(s, h: auto) = {
  block(
    height: h,
    stack(dir: ttb, ..s.clusters().map(x => [#x]).intersperse(1fr)),
  )
}


// #distr("你好，世界！测试。", w: 200pt)
