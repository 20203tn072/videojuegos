const fill = (list) => {
    let table = "";

    if(list.length > 0){
        for(let i = 0; i < list.length; i++) {
            table += `
			<tr>
				<td>${ i + 1 }</td>
				<td>${list[i].nameGame}</td>
				<td>${list[i].datePremiere}</td>
				<td><img src="data:image/jpeg;base64,${list[i].imgGame}"></td>
				<td>${list[i].status ? "Activo" : "Inactivo"}</td>
				<td>
					<button type="button" class="btn btn-info">Ver</button>
					<button type="button" class="btn btn-primary">Modificar</button>
					<button type="button" class="btn btn-danger">Eliminar</button>
				</td>
			</tr>
			`;
        }
    }else{
        table = `
		<tr class="text-center">
			<td colspan="5">No hay registros para mostrar</td>
		</tr>
		`;
    }
    $(`#container > tbody`).html(table);
};

const findAll = () => {
    const contextPath = window.location.origin + window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));

    $.ajax({
        type: 'GET',
        url: contextPath + '/readGames',
        data: { }
    }).done(function(res){
        fill(res.listGames);
    });
};

findAll();

function createGame(){
    let name = document.getElementById("name").value;
    let image = document.getElementById("imagen").files[0];
    let date = document.getElementById("datePremiere").value;
    let category = document.getElementById("categoria").value;
    let dataGame = new FormData();

    dataGame.append('action', 'create');
    dataGame.append('nameGame', name);
    dataGame.append('image', image);
    dataGame.append('date_Premiere', date);
    dataGame.append('idCategory', category);

    $.ajax({
        type: 'POST',
        url: 'http://localhost:8080/servletsAsync_3C_war/createGames',
        contentType: false,
        processData: false,
        data: dataGame
    }).done(function(res){
        console.log(res);
        let message = res.message;
        displayContent();
    });
};