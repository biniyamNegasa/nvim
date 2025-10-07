local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  s(
    "segtstruct",
    fmt(
      [[
template <typename {2}> struct {1} {{
  size_t n = 1;
  vector<{2}> tree;
  vector<{2}> temp_nums;
  function<{2}({2}, {2})> {3};
  {2} {4};

  {1}(const function<{2}({2}, {2})> &_{3}, const {2} &_{4})
      : {3}(_{3}), {4}(_{4}) {{}}

  void init(const vector<{2}> &nums) {{
    size_t sz = nums.size();
    while (n < sz)
      n <<= 1;

    temp_nums = nums;
    FOR(i, sz, n) {{ temp_nums.push_back({4}); }}

    tree.assign(n << 1, {4});
    build(0, temp_nums, 0, n - 1);
  }}

  {2} build(size_t node, const vector<{2}> &arr, size_t left, size_t right) {{
    if (left == right) {{
      if (left < (size_t)arr.size()) {{
        tree[node] = arr[left];
      }}
      return tree[node];
    }}

    size_t mid = left + ((right - left) >> 1);
    tree[node] = {3}(build(node * 2 + 1, arr, left, mid),
                         build(node * 2 + 2, arr, mid + 1, right));
    return tree[node];
  }}

  void update(size_t ind, {2} val) {{ _update(0, ind, val, 0, n - 1); }}

  void _update(size_t node, size_t ind, {2} val, size_t left, size_t right) {{
    if (left == right) {{
      temp_nums[ind] = val;
      tree[node] = val;
      return;
    }}

    size_t mid = left + ((right - left) >> 1);
    if (ind <= mid) {{
      _update(node * 2 + 1, ind, val, left, mid);
    }} else {{
      _update(node * 2 + 2, ind, val, mid + 1, right);
    }}
    tree[node] = {3}(tree[node * 2 + 1], tree[node * 2 + 2]);
  }}

  {2} range_query(size_t cleft, size_t cright) {{
    return _range_query(0, cleft, cright - 1, 0, n - 1);
  }}

  {2} _range_query(size_t node, size_t cleft, size_t cright, size_t left,
                 size_t right) {{
    if (cleft > right || cright < left) {{
      return {4};
    }}
    if (cleft <= left && right <= cright) {{
      return tree[node];
    }}

    size_t mid = left + ((right - left) >> 1);
    return {3}(_range_query(node * 2 + 1, cleft, cright, left, mid),
                   _range_query(node * 2 + 2, cleft, cright, mid + 1, right));
  }}

  size_t find_k({2} k) {{ return _find_k(0, k + 1, 0, n - 1); }}

  size_t _find_k(size_t node, {2} k, size_t left, size_t right) {{
    if (left == right) {{
      return left;
    }}

    size_t mid = left + ((right - left) >> 1);
    if (tree[node * 2 + 1] >= k) {{
      return _find_k(node * 2 + 1, k, left, mid);
    }}
    k -= tree[node * 2 + 1];
    return _find_k(node * 2 + 2, k, mid + 1, right);
  }}
}};
      ]],
      {
        i(1, "SegT"), -- Placeholder 1: Struct name
        i(2, "T"), -- Placeholder 2: Data type (template parameter)
        i(3, "combine"), -- Placeholder 3: Name of the combine function
        i(4, "identity"), -- Placeholder 4: Name of the identity element
      }
    )
  ),
}
