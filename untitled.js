let employees = [{
    id: 1,
    name: 'Linux Torvalds'
}, {
    id: 2,
    name: 'Bill Gates'
},{
    id: 3,
    name: 'Jeff Bezos'
}];
 
let salaries = [{
    id: 1,
    salary: 4000
}, {
    id: 2,
    salary: 1000
}, {
    id: 3,
    salary: 2000
}];

//DATOS EMPLEADOS
const getDatos = () => {

    return new Promise((res, rej) => {
        setTimeout(() => {
            res(employees)
        }, 500);
    });
}

//DATOS SALARIOS
const getDatosSalario = () => {

    return new Promise((res, rej) => {
        setTimeout(() => {
            res(salaries)
        }, 500);
    });
}

//RETURN A PROMISE
const getEmpleado = async () => {
    
    const datos = await getDatos()
    console.log(datos[0]);

    //THIS IS A PROMISE
    return datos[0]
} 
getEmpleado()

//RETURN A SALARY
const getSalario = async (employee) => {
    
    const id = employee.id;

    const salaries = await getDatosSalario();
    
    const salaryObj = salaries.filter( salary => salary.id === id )

    const salary = salaryObj[0].salary

    console.log(salary);
}

//WE PASS AN EMPLOYEE, e.g. the first one
getSalario(employees[0])
