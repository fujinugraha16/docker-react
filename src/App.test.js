import ReactDOM from "react-dom";
import App from "./App";

it("renders without crashing", (done) => {
  const div = document.createElement("div");
  ReactDOM.render(<App />, div);
  ReactDOM.unmountComponentAtNode(div);
  done();
});
