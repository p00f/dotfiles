-- "My" lmao what a joke
local snippets = require("snippets")
local U = require("snippets.utils")
local function note_snippet(header)
    local S = [[
${-1}:
 $0
   - ${=os.date()}]]
    S = U.force_comment(S)
    S = U.match_indentation(S)
    return U.iterate_variables_by_id(S, -1, function(v)
        v.default = header
    end)
end

snippets.snippets = {
    lua = {
        req = [[local ${2:${1|S.v:match"([^.()]+)[()]*$"}} = require '$1']],
        func = [[function${1|vim.trim(S.v):gsub("^%S"," %0")}(${2|vim.trim(S.v)})$0 end]],
        ["local"] = [[local ${2:${1|S.v:match"([^.()]+)[()]*$"}} = ${1}]],
        ["for"] = U.match_indentation([[
for ${1:i}, ${2:v} in ipairs(${3:t}) do
        $0
end]]),
        fori = U.match_indentation([[
for ${1:i} = ${2:1}, ${3:#t} do
        $0
end]]),
        forp = U.match_indentation([[
for ${1:k}, ${2:v} in pairs(${3:t}) do
        $0
end]]),
        ["if"] = U.match_indentation([[
if ${1:i} then
        $0
end]]),
        loc = "local $1 = $0",
        exp = "$1 = $1;",
        ymd = [[${=os.date('%Y-%m-%d')}]],

        todo = note_snippet("TODO"),
        note = note_snippet("NOTE"),
        idea = note_snippet("IDEA"),
        important = note_snippet("IMPORTANT"),
    },
    _global = {
        date = "${=os.date()}",
        epoch = "${=os.time()}",
    },
    cpp = {
        base = U.match_indentation([[
#include <bits/stdc++.h>
#include <vector>
#define REP(i, n) for (int i = 0; (i) < (int)(n); ++(i))
#define REP3(i, m, n) for (int i = (m); (i) < (int)(n); ++(i))
#define REP_R(i, n) for (int i = (int)(n)-1; (i) >= 0; --(i))
#define REP3R(i, m, n) for (int i = (int)(n)-1; (i) >= (int)(m); --(i))
#define ALL(x) ::std::begin(x), ::std::end(x)
#define PB push_back
using namespace std;
typedef vector<int> vi;
typedef pair<int, int> pi;
typedef long long ll;

int main()
{
        ios::sync_with_stdio(false);
        cin.tie(nullptr);
        constexpr char endl = '\n';
        int t;
        cin >> t;
        while (t--) {
                $0
        }
        return 0;
}]]),
        REP = U.match_indentation([[
REP( ${1:i}, ${2:i} ) {
        $0
}]]),
        inc = [[#include "${=vim.fn.expand("%:t"):upper()}"]],
        debug = U.match_indentation([[
vector<string> vec_splitter(string s)
{
        s += ',';
        vector<string> res;
        while (!s.empty()) {
                res.push_back(s.substr(0, s.find(',')));
                s = s.substr(s.find(',') + 1);
        }
        return res;
}
void debug_out(
    vector<string> __attribute__((unused)) args,
    __attribute__((unused)) int idx,
    __attribute__((unused)) int LINE_NUM) { cerr << endl; }
template <typename Head, typename... Tail>
void debug_out(vector<string> args, int idx, int LINE_NUM, Head H, Tail... T)
{
        if (idx > 0)
                cerr << ", ";
        else
                cerr << "Line(" << LINE_NUM << ") ";
        stringstream ss;
        ss << H;
        cerr << args[idx] << " = " << ss.str();
        debug_out(args, idx + 1, LINE_NUM, T...);
}
#ifdef XOX
#define debug(...) debug_out(vec_splitter(#__VA_ARGS__), 0, __LINE__, __VA_ARGS__)
#else
#define debug(...) 42
#endif
]]),
        debugin = U.match_indentation([[
#ifdef XOX
freopen("input1", "r", stdin);
#endif]]),
        freq_str = U.match_indentation([[
unordered_map<char, int> freq_str(string s)
{
        unordered_map<char, int> freqs;
        for (char c : s) {
                freqs[c]++;
        }
        return freqs;
}
]]),
        freq_intvec = U.match_indentation([[
unordered_map<int, int> freq_intarr(vector<int> src)
{
        unordered_map<int, int> freqs;
        for (int x: src) {
		freqs[x]++;
	}
	return freqs;
}
]]),
        ceil = U.match_indentation([[
int ceil_div(int x, int y)
{
        return (x + y - 1) / y;
}]]),
    },
    rust = {
        parse_int = "scan.token::<${1:usize}>();",
        parse_intvec = "(0..${1:n}).map(|_| scan.token()).collect();",
        freqmap = U.match_indentation([[
let mut ${1:freqs} = HashMap::new();
for x in &${2:v} {
    let count = $1.entry(x).or_insert(0);
    *count += 1;
}]]),
        ncr = U.match_indentation([[
fn count_combinations(n: u64, r: u64) -> u64 {
    if r > n {
        0
    } else {
        (1..=r.min(n - r)).fold(1, |acc, val| acc * (n - val + 1) / val)
    }
}]]),
        npr = U.match_indentation([[
fn count_permutations(n: u64, r: u64) -> u64 {
    (n - r + 1..=n).product()
}]]),
        file_stdin = U.match_indentation([[
let f = File::open("input1").unwrap(); // DELET THIS 🔫
let f = BufReader::new(f); // DELET THIS 🔫
let mut scan = Scanner::new(f); // CHANGE THIS BACK 🔫]]),
        base = U.match_indentation([[
#![allow(unused_imports)]
use std::{io::{self, prelude::*}, str};

fn solve<R: BufRead, W: Write>(scan: &mut Scanner<R>, w: &mut W) {
    for _ in 0..scan.token::<usize>() {
        $0
    }
}

fn main() {
    let (stdin, stdout) = (io::stdin(), io::stdout());
    let mut scan = Scanner::new(stdin.lock());
    let mut out = io::BufWriter::new(stdout.lock());
    solve(&mut scan, &mut out);
}

struct Scanner<R> {
    reader: R,
    buf_str: Vec<u8>,
    buf_iter: str::SplitWhitespace<'static>,
}
impl<R: BufRead> Scanner<R> {
    fn new(reader: R) -> Self {
        Self {
            reader,
            buf_str: vec![],
            buf_iter: "".split_whitespace(),
        }
    }
    fn token<T: str::FromStr>(&mut self) -> T {
        loop {
            if let Some(token) = self.buf_iter.next() {
                return token.parse().ok().expect("Failed parse");
            }
            self.buf_str.clear();
            self.reader
                .read_until(b'\n', &mut self.buf_str)
                .expect("Failed to read");
            self.buf_iter = unsafe {
                let slice = str::from_utf8_unchecked(&self.buf_str);
                std::mem::transmute(slice.split_whitespace())
            }
        }
    }
}]]),
    },
}
local s = [[let snippet-file-name = 'blah blah'
fun FileSpecificSnippets()
    if lines('$') == 0 && getline('.') == ''
        set -l fname = expand('%')
        " check this seperately, so you can easily add more of these in the future
        if fname == 'your-filename.nvim'
            " I don't actually use snippets.nvim, I'm certain this isn't how you use it,
            " so just replace this line with whichever function from that plugin you'd like to call
            execute 'r! cat ' . snippet-file-name
        " elseif fname == '???'
            " ...
        end
    end
endf

" feel free to change this hook, this is just the only reasonable one to me
au bufRead * call FileSpecificSnippets()]]
