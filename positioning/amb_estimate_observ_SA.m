function [N_stim, sigmaq_N_stim] = amb_estimate_observ_SA(pr_Rsat, ph_Rsat, phase)

% SYNTAX:
%   [N_stim, sigmaq_N_stim] = amb_estimate_observ_SA(pr_Rsat, ph_Rsat, phase);
%
% INPUT:
%   pr_Rsat = ROVER-SATELLITE code-pseudorange
%   ph_Rsat = ROVER-SATELLITE phase-pseudorange
%   phase = carrier L1 (phase=1), carrier L2 (phase=2)
%
% OUTPUT:
%   N_stim = linear combination ambiguity estimate
%   sigmaq_N_stim = assessed variances of combined ambiguity
%
% DESCRIPTION:
%   Estimation of phase ambiguities (and of their error variance) by
%   using both phase and code observations (satellite-receiver distance) in
%   stand-alone mode.

%----------------------------------------------------------------------------------------------
%                           goGPS v0.3.0 beta
%
% Copyright (C) 2009-2012 Mirko Reguzzoni, Eugenio Realini
%----------------------------------------------------------------------------------------------
%
%    This program is free software: you can redistribute it and/or modify
%    it under the terms of the GNU General Public License as published by
%    the Free Software Foundation, either version 3 of the License, or
%    (at your option) any later version.
%
%    This program is distributed in the hope that it will be useful,
%    but WITHOUT ANY WARRANTY; without even the implied warranty of
%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%    GNU General Public License for more details.
%
%    You should have received a copy of the GNU General Public License
%    along with this program.  If not, see <http://www.gnu.org/licenses/>.
%----------------------------------------------------------------------------------------------

%variables initialization
global lambda1
global lambda2
global sigmaq_cod1

if (phase == 1)
    N_stim = ((pr_Rsat - ph_Rsat * lambda1)) / lambda1;
    sigmaq_N_stim = sigmaq_cod1 / lambda1^2;
else
    N_stim = ((pr_Rsat - ph_Rsat * lambda2)) / lambda2;
    sigmaq_N_stim = sigmaq_cod1 / lambda2^2;
end
