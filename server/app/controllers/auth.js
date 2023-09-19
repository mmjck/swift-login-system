import jwt from 'jsonwebtoken'

const user = [
    {
        id: 1,   
        name: "user 1",
        password:'teste123',
        email: 'user@teste.com'
    }
]

const SECRET = "123AXX!@#"
const index = async(req, res) => { 
    try {
        console.log(req.cookie)
        res.status(200).json(user);
    } catch (error) {
        res.status(500).json({"message":"something is wrong"});
    }
}



const signin = async(req, res) => { 
    try {
        const {name, password, email} = req.body
        console.log({name, password, email});


        const data = user.find((e) => e.email == email)

        if(data){

            if(password == data.password){
                const token = {
                    accessToken: createAndAddJwtToRes(email, name, res)
                }
                return res.status(201).json(token)
            }


            res.status(500).send('Something broke!');

        }

        res.status(500).send('Something broke!');

    } catch (error) {
        res.status(500).json({"message":"something is wrong"});
    }
}


const create = async (req, res) => {
    try {
        console.log(req.body);
        const {name, password, email} = req.body
        console.log({name, password, email});
        
        const data = {
            name, 
            password, 
            email, 
            id: user.length + 1
        }

        user.push(data)

        const token = {
            accessToken: createAndAddJwtToRes(email, name, res)
        }
        return res.status(201).json(token)
    } catch (error) {
        console.log(error);
        res.status(500);
    }
}


const createAndAddJwtToRes = function createAndAddJwtToRes(email, username, res) {
    const json = jwt.sign({ email, username },SECRET , { expiresIn: 86400 * 14, } );

    console.log(json);
    return json
    //jwt', json, { httpOnly: true, maxAge: 86400 * 14 * 1000 } ;
};


export default { signin, create, createAndAddJwtToRes, index};