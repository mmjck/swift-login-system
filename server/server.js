import express from 'express';
import cookieParser from 'cookie-parser';
import routes from "./app/routes/index.js";


const app = express();


app.set('views', './src/views');
app.set('view engine', 'ejs');

app.use(express.json())
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());

app.use(routes);
const PORT = 3000;

app.listen(PORT, (error) =>{
	if(!error)
		console.log("Server is Successfully Running, and App is listening on port " +  PORT)
	else
		console.log("Error occurred, server can't start", error);
	}
);
