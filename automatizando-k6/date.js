import exec from 'k6/x/exec';

export default function () {
  console.log(exec.command("date"));
//   console.log(exec.command("curl",["-o fahham.txt", "-I", "https://www.globo.com"]));
}

// ./k6 run date.js