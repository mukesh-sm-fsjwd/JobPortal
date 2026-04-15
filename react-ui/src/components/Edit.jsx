import React, { useEffect, useState } from 'react';
import axios from 'axios';
import { useNavigate, useLocation } from 'react-router-dom';

// Same skill set as original
const skillSet = [
  { name: 'Javascript' },
  { name: 'Java' },
  { name: 'Python' },
  { name: 'Django' },
  { name: 'Rust' },
];

const CheckIcon = () => (
  <svg width="10" height="10" viewBox="0 0 24 24" fill="none" stroke="white" strokeWidth="3.5" strokeLinecap="round" strokeLinejoin="round">
    <polyline points="20 6 9 17 4 12"/>
  </svg>
);

const Edit = () => {
  const [postId, setPostId]               = useState('');
  const [postProfile, setPostProfile]     = useState('');
  const [postDesc, setPostDesc]           = useState('');
  const [reqExperience, setReqExperience] = useState('');
  const [postTechStack, setPostTechStack] = useState([]);
  const [loading, setLoading]             = useState(false);
  const [fetching, setFetching]           = useState(true);
  const [toast, setToast]                 = useState(null);

  const navigate  = useNavigate();
  const location  = useLocation();

  // ── same logic as original — fetch existing post by id ──
  useEffect(() => {
    const id = location.state?.id;
    if (!id) {
      navigate('/');
      return;
    }
    const fetchPost = async () => {
      try {
        const response = await axios.get(`http://localhost:8080/jobPost/${id}`);
        const p = response.data;
        setPostId(p.postId);
        setPostProfile(p.postProfile);
        setPostDesc(p.postDesc);
        setReqExperience(p.reqExperience);
        setPostTechStack(p.postTechStack ?? []);
      } catch (err) {
        console.error(err);
      } finally {
        setFetching(false);
      }
    };
    fetchPost();
  }, [location.state, navigate]);

  const handleSkillChange = (skillName) => {
    setPostTechStack((prev) =>
      prev.includes(skillName)
        ? prev.filter((s) => s !== skillName)
        : [...prev, skillName]
    );
  };

  const showToast = (type, message) => {
    setToast({ type, message });
    setTimeout(() => setToast(null), 3000);
  };

  // ── same logic as original — PUT/POST to update ──
  const handleSubmit = async (e) => {
    e.preventDefault();
    setLoading(true);
    try {
      await axios.post('http://localhost:8080/jobPost', {
        postId,
        postProfile,
        postDesc,
        reqExperience,
        postTechStack,
      });
      showToast('success', 'Job updated successfully!');
      setTimeout(() => navigate('/'), 1500);
    } catch (err) {
      console.error(err);
      showToast('error', 'Update failed. Check your connection.');
    } finally {
      setLoading(false);
    }
  };

  if (fetching) {
    return (
      <div className="form-page">
        <div className="loading-state">
          <div className="spinner" />
          <span>Loading job details…</span>
        </div>
      </div>
    );
  }

  return (
    <div className="form-page">
      <div className="form-container">
        <div className="form-card">

          {/* Header */}
          <div className="form-header">
            <span className="form-badge">
              <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round">
                <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"/>
                <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"/>
              </svg>
              Edit Job
            </span>
            <h1 className="form-title">Update Job Listing</h1>
            <p className="form-subtitle">Modify the details and save your changes</p>
          </div>

          {/* Form */}
          <form onSubmit={handleSubmit} noValidate>

            <div className="form-row">
              {/* Post ID */}
              <div className="form-group">
                <label htmlFor="edit-postId" className="form-label">Job ID</label>
                <input
                  id="edit-postId"
                  type="number"
                  className="form-input"
                  value={postId}
                  onChange={(e) => setPostId(e.target.value)}
                  required
                  readOnly
                  style={{ opacity: 0.6, cursor: 'not-allowed' }}
                />
              </div>

              {/* Experience */}
              <div className="form-group">
                <label htmlFor="edit-reqExperience" className="form-label">Experience (years)</label>
                <input
                  id="edit-reqExperience"
                  type="number"
                  className="form-input"
                  value={reqExperience}
                  onChange={(e) => setReqExperience(e.target.value)}
                  required
                  min="0"
                />
              </div>
            </div>

            {/* Profile */}
            <div className="form-group">
              <label htmlFor="edit-postProfile" className="form-label">Job Profile / Title</label>
              <input
                id="edit-postProfile"
                type="text"
                className="form-input"
                placeholder="e.g. Senior React Developer"
                value={postProfile}
                onChange={(e) => setPostProfile(e.target.value)}
                required
              />
            </div>

            {/* Description */}
            <div className="form-group">
              <label htmlFor="edit-postDesc" className="form-label">Job Description</label>
              <textarea
                id="edit-postDesc"
                className="form-textarea"
                placeholder="Describe the role, responsibilities, and requirements…"
                value={postDesc}
                onChange={(e) => setPostDesc(e.target.value)}
                required
              />
            </div>

            <div className="form-divider" />

            {/* Skills */}
            <div>
              <p className="skills-section-label">Required Tech Stack</p>
              <div className="skills-grid">
                {skillSet.map((skill) => (
                  <div key={skill.name} className="skill-toggle">
                    <input
                      type="checkbox"
                      id={`edit-skill-${skill.name}`}
                      checked={postTechStack.includes(skill.name)}
                      onChange={() => handleSkillChange(skill.name)}
                    />
                    <label htmlFor={`edit-skill-${skill.name}`} className="skill-label">
                      <span className="skill-check-icon">
                        <CheckIcon />
                      </span>
                      {skill.name}
                    </label>
                  </div>
                ))}
              </div>
            </div>

            {/* Actions */}
            <div className="form-actions">
              <button
                type="button"
                className="btn-secondary"
                onClick={() => navigate('/')}
              >
                Cancel
              </button>
              <button
                id="submit-edit"
                type="submit"
                className="btn-primary"
                disabled={loading}
              >
                {loading
                  ? 'Saving…'
                  : (
                    <>
                      <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round">
                        <path d="M19 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11l5 5v11a2 2 0 0 1-2 2z"/>
                        <polyline points="17 21 17 13 7 13 7 21"/>
                        <polyline points="7 3 7 8 15 8"/>
                      </svg>
                      Save Changes
                    </>
                  )
                }
              </button>
            </div>
          </form>
        </div>
      </div>

      {/* Toast */}
      {toast && (
        <div className={`toast ${toast.type}`} role="alert">
          {toast.type === 'success' ? '✓' : '✕'} {toast.message}
        </div>
      )}
    </div>
  );
};

export default Edit;
