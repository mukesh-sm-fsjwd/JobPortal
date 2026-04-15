import React from 'react';
import { useNavigate, useLocation } from 'react-router-dom';

const Navbar = () => {
  const navigate = useNavigate();
  const location = useLocation();

  return (
    <nav className="navbar">
      <div className="navbar-inner">

        {/* Brand */}
        <div className="brand" onClick={() => navigate('/')} role="button" aria-label="Go to home">
          <div className="brand-logo">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.2" strokeLinecap="round" strokeLinejoin="round">
              <rect x="2" y="7" width="20" height="14" rx="2" ry="2" />
              <path d="M16 7V5a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v2" />
              <line x1="12" y1="12" x2="12" y2="12" />
              <path d="M2 12h20" />
            </svg>
          </div>
          <span className="brand-name">Job<span>Portal</span></span>
        </div>

        {/* Links */}
        <div className="nav-links">
          <button
            id="nav-browse-jobs"
            className={`nav-link ${location.pathname === '/' ? 'active' : ''}`}
            onClick={() => navigate('/')}
          >
            Browse Jobs
          </button>

          <button
            id="nav-post-job"
            className="nav-btn-primary"
            onClick={() => navigate('/create')}
          >
            + Post a Job
          </button>
        </div>

      </div>
    </nav>
  );
};

export default Navbar;
