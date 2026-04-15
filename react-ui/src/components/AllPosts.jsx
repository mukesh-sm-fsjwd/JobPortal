import React from 'react';
import axios from 'axios';
import { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';

// ── Icon helpers ──────────────────────────────────────────────
const EditIcon = () => (
  <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.2" strokeLinecap="round" strokeLinejoin="round">
    <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"/>
    <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"/>
  </svg>
);

const DeleteIcon = () => (
  <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.2" strokeLinecap="round" strokeLinejoin="round">
    <polyline points="3 6 5 6 21 6"/>
    <path d="M19 6l-1 14a2 2 0 0 1-2 2H8a2 2 0 0 1-2-2L5 6"/>
    <path d="M10 11v6M14 11v6"/>
    <path d="M9 6V4a1 1 0 0 1 1-1h4a1 1 0 0 1 1 1v2"/>
  </svg>
);

const ClockIcon = () => (
  <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round">
    <circle cx="12" cy="12" r="10"/>
    <polyline points="12 6 12 12 16 14"/>
  </svg>
);

// ── Search Icon ────────────────────────────────────────────────
const SearchIcon = () => (
  <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.2" strokeLinecap="round" strokeLinejoin="round">
    <circle cx="11" cy="11" r="8"/>
    <line x1="21" y1="21" x2="16.65" y2="16.65"/>
  </svg>
);

// ── Component ──────────────────────────────────────────────────
const AllPosts = () => {
  const [post, setPost]             = useState(null);
  const [loading, setLoading]       = useState(true);
  const [searchTerm, setSearchTerm] = useState('');
  const [searching, setSearching]   = useState(false);
  const navigate                    = useNavigate();

  // ── same logic as original ──
  const handleEdit = (id) => {
    navigate('/edit', { state: { id } });
  };

  // ── initial load ──
  useEffect(() => {
    const fetchInitialPosts = async () => {
      const response = await axios.get(`http://localhost:8080/jobPosts`);
      setPost(response.data);
      setLoading(false);
    };
    fetchInitialPosts();
  }, []);

  // ── live search – fires on every keystroke ──
  useEffect(() => {
    if (loading) return; // wait for initial load first
    if (searchTerm.trim() === '') {
      // restore full list when search is cleared
      const fetchAll = async () => {
        setSearching(true);
        const response = await axios.get(`http://localhost:8080/jobPosts`);
        setPost(response.data);
        setSearching(false);
      };
      fetchAll();
      return;
    }
    const fetchByKeyword = async () => {
      setSearching(true);
      const response = await axios.get(
        `http://localhost:8080/jobPosts/keyword/${encodeURIComponent(searchTerm.trim())}`
      );
      setPost(response.data);
      setSearching(false);
    };
    fetchByKeyword();
  }, [searchTerm]); // eslint-disable-line react-hooks/exhaustive-deps

  const handleDelete = (id) => {
    async function deletePost() {
      await axios.delete(`http://localhost:8080/jobPost/${id}`);
      console.log('Delete');
    }
    deletePost();
    window.location.reload();
  };

  // ── render ──
  return (
    <main className="page">
      <div className="page-inner">

        {/* Header */}
        <header className="page-header">
          <h1 className="page-title">Explore Job Openings</h1>
          <p className="page-subtitle">Discover opportunities that match your skills and experience</p>
        </header>

        {/* Search Bar */}
        <div className="search-bar-wrapper">
          <div className="search-bar">
            <span className="search-icon" aria-hidden="true"><SearchIcon /></span>
            <input
              id="job-search-input"
              type="text"
              className="search-input"
              placeholder="Search by job title or description…"
              value={searchTerm}
              onChange={(e) => setSearchTerm(e.target.value)}
              autoComplete="off"
            />
            {searching && <span className="search-spinner" />}
            {searchTerm && (
              <button
                id="search-clear-btn"
                className="search-clear-btn"
                onClick={() => setSearchTerm('')}
                aria-label="Clear search"
              >✕</button>
            )}
          </div>
        </div>

        {/* Loading */}
        {loading && (
          <div className="loading-state" aria-label="Loading jobs">
            <div className="spinner" />
            <span>Fetching jobs…</span>
          </div>
        )}

        {/* Empty */}
        {!loading && post && post.length === 0 && (
          <div className="empty-state">
            {searchTerm.trim() ? (
              <>
                <div className="empty-icon">🔍</div>
                <h3>No results for &ldquo;{searchTerm}&rdquo;</h3>
                <p>Try a different keyword or clear the search</p>
              </>
            ) : (
              <>
                <div className="empty-icon">📋</div>
                <h3>No jobs posted yet</h3>
                <p>Be the first to post a job opening</p>
              </>
            )}
          </div>
        )}

        {/* Grid */}
        <div className="posts-grid">
          {post && post.map((p) => (
            <article key={p.postId} className="job-card" id={`job-card-${p.postId}`}>

              {/* Top row: avatar + actions */}
              <div className="card-top">
                <div className="card-avatar" aria-hidden="true">
                  {p.postProfile?.charAt(0)?.toUpperCase() ?? '?'}
                </div>
                <div className="card-actions">
                  <button
                    id={`edit-btn-${p.postId}`}
                    className="action-btn edit"
                    onClick={() => handleEdit(p.postId)}
                    title="Edit job"
                    aria-label={`Edit ${p.postProfile}`}
                  >
                    <EditIcon />
                  </button>
                  <button
                    id={`delete-btn-${p.postId}`}
                    className="action-btn delete"
                    onClick={() => handleDelete(p.postId)}
                    title="Delete job"
                    aria-label={`Delete ${p.postProfile}`}
                  >
                    <DeleteIcon />
                  </button>
                </div>
              </div>

              {/* Content */}
              <div>
                <h2 className="card-profile">{p.postProfile}</h2>
                <p className="card-desc">{p.postDesc}</p>
              </div>

              {/* Footer */}
              <div className="card-footer">
                <span className="exp-badge">
                  <ClockIcon />
                  {p.reqExperience} {p.reqExperience === 1 ? 'year' : 'years'} experience
                </span>
                <div className="skills-row" aria-label="Required skills">
                  {p.postTechStack && p.postTechStack.map((s, i) => (
                    <span key={i} className="skill-chip">{s}</span>
                  ))}
                </div>
              </div>

            </article>
          ))}
        </div>

      </div>
    </main>
  );
};

export default AllPosts;
