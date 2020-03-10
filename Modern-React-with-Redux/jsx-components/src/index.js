import React from "react";
import ReactDOM from "react-dom";
import faker from "faker";

import CommentDetail from "./CommentDetail";
import ApprovalCard from "./ApprovalCard";

const App = () => {
  return (
    <div className="ui container comments">
      <ApprovalCard>Are you sure you want to do that?</ApprovalCard>
      <ApprovalCard>
        <CommentDetail
          author="Sam"
          postTime="Today at 4:45PM"
          text="A Nice Comment"
          avatar={faker.image.avatar()}
        />
      </ApprovalCard>
      <ApprovalCard>
        <CommentDetail
          author="Jess"
          postTime="Today at 3:45PM"
          text="A Mean Comment"
          av
          avatar={faker.image.avatar()}
        />
      </ApprovalCard>
      <ApprovalCard>
        <CommentDetail
          author="Jeff"
          postTime="Today at 2:45PM"
          text="A Neutral Comment"
          avatar={faker.image.avatar()}
        />
      </ApprovalCard>
    </div>
  );
};

ReactDOM.render(<App />, document.querySelector("#root"));
