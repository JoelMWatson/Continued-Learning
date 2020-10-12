import React from 'react';

import { Container } from 'semantic-ui-react';
import Head from 'next/head'; // awesome helper from next to move tags to head
import Header from './Header';

const Layout = ({ children }) => {
  return (
    <Container>
      <Head>
        <link
          async
          rel='stylesheet'
          href='https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css'
        />
      </Head>
      <Header />
      {children}
      {/* Footer could go here */}
    </Container>
  );
};

export default Layout;
