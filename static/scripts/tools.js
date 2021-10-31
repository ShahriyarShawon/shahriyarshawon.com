function genEq(){
    let cols = document.getElementById("columns").value.split(",")
    let dof = cols.length - 1
    let rows = document.getElementById("rows").value.split(",")
    let arr = []

    cols.forEach(col => {
        // arr.push("(" + col + rows[0] + "-" + col + rows[1] + ")^2")
        arr.push(`(${col}${rows[0]}-${col}${rows[1]})^2`)
    });

    let eq = `=SQRT((${arr.join("+")})/${dof})`

    document.getElementById("eq").innerText =  eq
}