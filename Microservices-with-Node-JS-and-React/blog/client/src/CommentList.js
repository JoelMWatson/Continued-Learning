import React from 'react';

const CommentList = ({comments}) => {
  const renderComments = comments.map(comment => {
    let content;

    if (comment.status === 'approved') {
      content = comment.content;
    }
    if (comment.status === 'pending') {
      content = 'pending review';
    }
    if (comment.status === 'rejected') {
      content = 'rejected comment';
    }
   
    return <li key={comment.id}>{content}</li>
  });

  return <div>
    {renderComments}
  </div>
}

export default CommentList