let elTree = "";
let count = 0;

function buttonClick() {
    let nodeList = document.getElementById("html").children;
    elTree += "<!DOCTYPE html>\n<html>\n";
    Output(nodeList);
    elTree += "\n</html>";

    console.log(elTree);

    let text = document.createTextNode(elTree);
    document.getElementById("htmlCode").appendChild(text);
}

function Output(nodes) {
    count += 1;

    for (let i = 0; i < nodes.length; i++) {
        if (i != 0) elTree += "\n"
        for (let j = 0; j < count; j++) elTree += "\u00A0\u00A0\u00A0\u00A0";

        elTree += "<" + nodes[i].localName + ">";
        if (nodes[i].children.length != 0) {
            elTree += "\n"
            Output(nodes[i].children)

            elTree += "\n";
            count -= 1;
            for (let j = 0; j < count; j++) elTree += "\u00A0\u00A0\u00A0\u00A0";
            elTree += "</" + nodes[i].localName + ">";
        }
        else {
            elTree += "</" + nodes[i].localName + ">";
        }
    }
}