Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAD01396
	for <dtrace@lists.linux.dev>; Fri,  2 Aug 2024 21:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722634644; cv=fail; b=Zl7W6gam6n55wS8mdF9oH4ggA2Cwe2JtevxB8PuvNxo4MQT7iJh2bciD/yWOYpgiIMI5ndkG2kX+hpysWNkV27lncoE7I8B/g6bZJP/FoeghgGgloARykt/VSsEypKnhwbsTcwkPHuoOUAxzc6LRiJln2iOHTS+8Xcw6ePOcx20=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722634644; c=relaxed/simple;
	bh=Q6Lr4Wx8ibT0rpgDZsuc0Whvy+PGi428mTM4OVvZ54I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VnKSr4cvZMm4Nx9RXzH1R1nfRaZmP6+jINYgSiWYScDwmghzfJY70o5QNv2iN9gZ6dPu35kLitkUWcnmG3E0D0NTje21i6toMpw8HcyHVUDYrXPHWS01iK+DgXYOJgPZzcnZqjakp42e8mGa7h1VITikqlnOZl61hAY0JXbUHXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=AD3lcuBM; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=dtTH5+t3; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="AD3lcuBM";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dtTH5+t3"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 472GtX0u004607
	for <dtrace@lists.linux.dev>; Fri, 2 Aug 2024 21:37:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=TJ/goWiGgr+47bP
	PoO0pIUL7DPPM5jOpaYhRyWx2RSw=; b=AD3lcuBM8Rt7YBOpiuyktG2fXFheniq
	x0NLGc022uLg60ZsdB1WSaQ9QSOUI+dnTcmGH/BUUVSv6B1BueqmVjfD1I0BsONc
	/dUJ9Ta7VbfFIv35K3kOVMvFWHqD3tzcz2xkUzlzBgMf1K3N6DelGap73QgQoPiJ
	u2mHSLeNwR6uGvNvf13PXVrGn1lycf8rbyBH124nGf2GV41WbdoONe0r9KIutBjh
	LxNLNjeRmcADATfW8M47jIB5IhwS3L2uQTJwxd6CFZ3DvSiboA1kc+9hvdLMk6Ab
	aUCgdk4e4WjpfBjWKbdC7QO4FX8K245vtTbOCh2BADVz2IUo5Ip5Uhw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40rjg5j9jj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 02 Aug 2024 21:37:20 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 472LJsTT035412
	for <dtrace@lists.linux.dev>; Fri, 2 Aug 2024 21:37:20 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40pm87u97n-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 02 Aug 2024 21:37:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G79fx2mK/2MEcDr8UvUHINjpzsgpGymk8ARDeRctvSJq3UooIHfVlwntypCfw2aHFDy4/Bf245DYENJrBM4jUVi3RscM7ZToF1gFtelgjf3yiPcpVFZ6aF8DFUJq07LeCkn21ishdEPJXmBVuIQHGniNmmtZCOL66xdl9hCwrUwpauZ/Pmv1RLadOHTAXNHP7yyJA4pH985AlbQJdAuudXgyePjgUzVRREUPeE2jox+F3PWDhtpmVcG52TeRI7dS2BZyuhYQ0nXXaVypIur5oIMmltLG4tKutEhIfGDwlUfh6MYNMVDM4z5fbe/syLLUp3mxLWmLa5CzYOqtLz1+xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TJ/goWiGgr+47bPPoO0pIUL7DPPM5jOpaYhRyWx2RSw=;
 b=edsdkGMtGgnzZZvtgKCZQ2MXyt4ZUb7lNZJwNtHkYCzwCWAIHFIIZAzS6cOrPqNUADkyUMCOfIP6GM1EwYdGM2RIckG5hS92fEtHOuvc2kX6DyhJRE/9RnhrV6QM3W4D3+TqwplO3BHzOfRtCPwUy37J6EJ4S2FtH6VL3QCA1iPIJYirF3xbJtIrlhnAeBBn5seezyqUhRMLKvaiqLlg5Gp+IXbebQpO0oKtVCFGGPC20dQqEez062+gPX8ldys90TFCg0LCkNyGR6V70U19suNWvTZUNbZHehwFJbZxD6H5zqmHmZubJ220lEib+4Y0lxB6purCi5o/iJ5fEiR2lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TJ/goWiGgr+47bPPoO0pIUL7DPPM5jOpaYhRyWx2RSw=;
 b=dtTH5+t3ZboTWH4qECfTVmMLC0cB0W5XS35b3zDQL+84XYVqMTYVDcyzHPJ8LhsBWVgsNXQmDHuyZcBHPjRXK/qtonWNAe4onlQbMuc3QfhwYhBHhiW/TKasqb42MxdWu7uZyliz1ozhr09F/OWGUj9LdeCnY21GiLFuVyAfrgA=
Received: from PH8PR10MB6292.namprd10.prod.outlook.com (2603:10b6:510:1c3::5)
 by SN7PR10MB7073.namprd10.prod.outlook.com (2603:10b6:806:34e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.24; Fri, 2 Aug
 2024 21:37:15 +0000
Received: from PH8PR10MB6292.namprd10.prod.outlook.com
 ([fe80::7f53:c7c9:4dc6:d4a6]) by PH8PR10MB6292.namprd10.prod.outlook.com
 ([fe80::7f53:c7c9:4dc6:d4a6%2]) with mapi id 15.20.7807.026; Fri, 2 Aug 2024
 21:37:15 +0000
Date: Fri, 2 Aug 2024 17:37:11 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2 2/2] unittest/sched: remove dtv2 xfail
Message-ID: <Zq1Rhz25fVX5eb8h@oracle.com>
References: <20240628171634.2801954-1-alan.maguire@oracle.com>
 <20240628171634.2801954-2-alan.maguire@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240628171634.2801954-2-alan.maguire@oracle.com>
X-ClientProxiedBy: MN2PR12CA0018.namprd12.prod.outlook.com
 (2603:10b6:208:a8::31) To PH8PR10MB6292.namprd10.prod.outlook.com
 (2603:10b6:510:1c3::5)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6292:EE_|SN7PR10MB7073:EE_
X-MS-Office365-Filtering-Correlation-Id: e7a967dc-e0a4-457c-14ce-08dcb33b46ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VAEyOnQJZCyeUaJsCEfVxwW2fdGs3D1EPJMRE2/j63Z2VnYsVdmntlJrWM3w?=
 =?us-ascii?Q?Deb4RYvFoXDlqv2padHSjgXnma7Giv2/NR5jgHVpnRJcczRgT/Qqp+7yP6CA?=
 =?us-ascii?Q?Le4NMC6/AjPKGEkKsuizHGF8MyFsvK0aoxdJ+AdKQLTIHgxaxew7ygqiMKRg?=
 =?us-ascii?Q?En57gBoKO90V3tm4wmN8AHzuokRLOVGAZE/N0PcIqIt8NxUSSGho5JwsIWXw?=
 =?us-ascii?Q?TWDlzDkM3sTmS69+0AeJDHlTUM8vz35EoGzOmI9/nJBk3OIny+4/M4dvEJAt?=
 =?us-ascii?Q?kcQJZ4OmqedHtsOo8wORm0ihMrfOIrArgyjV53N7YMmwuaRW7Px0+BzDpeXg?=
 =?us-ascii?Q?yaXbJ6GWfMNre+qTE+AeRUv+A7BBgs+us7V3zQzXBsFVEo+0zs0V/cHq83JF?=
 =?us-ascii?Q?DQld4axdu5opsVGVuyPB5pSNF0Ad2TiYpQa/M91oIiLcb6KjIO8BCu3ZzPhu?=
 =?us-ascii?Q?JtqOaYq9BvmyoZdsgnfubnsvvAtRtUKGJa9Jm8vWZZwYBlYj9q52X929AI1U?=
 =?us-ascii?Q?C+Ufr5b6UlPGUUIV+7WsvrFNmFPGYdDcTDWL96ZTH0R9GricLoOsL9PqlgB3?=
 =?us-ascii?Q?dbKMBnBfNmLjOUhy66jIENT7K7mHBP+/81coi418BAfJ0XPL+ohgxYw/YRqC?=
 =?us-ascii?Q?ppRXNElQ3Qq3Ia2n5Nn5Puaz2Qhkqx6FVq8UR8XOnz96Z8wpDuTp4cNT6btt?=
 =?us-ascii?Q?jSoRV5no5D5iKDBuu9u0uRc1/h9g1xCy8hNmjMuQSlIvQ31TdfUKF+6hvCi3?=
 =?us-ascii?Q?Xd6LGboQk/EfhpduMoZK5ORNbzUWQkKrJCpZ3FeXYvNQc1tPy8oD31oreC2l?=
 =?us-ascii?Q?/207WZUEAo6aET7h8ZCcHm46yLGhJ/xTLc0hkSLh93ItO94Gc3/WyYlt5umf?=
 =?us-ascii?Q?23p/kOCbjIRHQoc+86PgTCZN2KEV1eKhBb68aWMyfRykb+TV7dlvUNLZetba?=
 =?us-ascii?Q?GP7VWvUueAVrPVjF/UZkxTa2vA4RIRZZO6NCCgN/vf4rezUeip9sf92mc3G1?=
 =?us-ascii?Q?dWEl5Y413eFshx+3BlOHSoS0JIn3S9xCdJ/otVxlrZ+qfJ0z2/URuXXk+9y3?=
 =?us-ascii?Q?T3KXZprS1TSpPm26sn6ybpcixpO3U2RcqxcLX9+W2HobUe19Fid053tcgBZw?=
 =?us-ascii?Q?3qTuRC8ZAwzM9I4yrzNVyzt9lIpqkx+l0OvQbRftl7KKIBtxXuNZjYaY/Q50?=
 =?us-ascii?Q?DrQbUcG8avCfRcKWyMYFbwkgtjVXqE/igLNdCx3Rvhbpty2+l9oSF4QNnSxc?=
 =?us-ascii?Q?y/VNS3fedj9HbnddwOOAQfM54mZ6rqud9bdwNhN7CYT8o4VzrnGKJhsesv80?=
 =?us-ascii?Q?te6ZOqO9oPNBeVQd9CJc1gBaauWnodngtXd9n3xs1m47egA/lPBh/4gjjQKJ?=
 =?us-ascii?Q?H4JOGH8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6292.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QP2IyokG+rnEKRxpmbi9rToCV2okV3JMzsYTg+S6Apw4NE5zj/DyPCQx8sfC?=
 =?us-ascii?Q?f3Wg2M8gC52y8S3a1Zx6ewrUay+a4lVex3hocXd6+yY7hSf9INJZHTXPfjNW?=
 =?us-ascii?Q?+Dh6VwozBQJnbVeFI98H1UZgcWvRIHwmwFwcPVGtrkgWec2o/GtnCKgeTyLu?=
 =?us-ascii?Q?XBGVyHP8cTt1lyvr4d7N65Bk3v6oErSX9xgmPDqLLzTS1LCKrW6b/8Qr16g5?=
 =?us-ascii?Q?zJ6tW9fxk+l71hrXK96GUIcTO/TK1n1GpHu4Ad4arKUqnaWB/sdvdvnhIBRZ?=
 =?us-ascii?Q?b4XKSEoTtSG/SzI+JMEPAfUtowJRWsrAStk6qs7vYgXArmlW2QxqYv3a/QNt?=
 =?us-ascii?Q?KA25tpRpaaESqxAvzSIZp8S9kjKwGsz01qC+vYfRmqTOWUMPKcjwq9rlqhZn?=
 =?us-ascii?Q?CZkfNXAtsKvnWFGJcU298o7hZALg1IpL1Q2RVPReDRHnznvKRXixbpVbDMlj?=
 =?us-ascii?Q?Z8fkiDzhBI+w9UxLA3XPX/fRykx9OGSxZvmWjKfYjeXYPYQN+PKvEkFlT5BA?=
 =?us-ascii?Q?X42PBUfEPx7cdtRuolR6oJHMX4Kp0hxWWgCaVRntK0VItGu/gIZDtnL5r0F3?=
 =?us-ascii?Q?/ZOYnZUj5Mv3SZNmtF0n+PE39KWXF3SHhbiwDwe6Lmb8/4a7aNxZXGQ/x11k?=
 =?us-ascii?Q?nIqD5H1gZ81QtlCDAY2AybX/TbzHFoCzch9UjNiJruPicje7afIqg5rK1e32?=
 =?us-ascii?Q?/ZDx/cJJKVinDJ5V1Z9zzZ3V28Yr25CPnag/yddhq6ZzmxzzYil0yvR0MLUJ?=
 =?us-ascii?Q?Fmq7Qvh4tZvZPYuw6CGMTVi1pDIyY61vfQEThAwmU1Qev7Chapw7ZSrl8BsS?=
 =?us-ascii?Q?Vt38Nc4aH/Ku8+wR5A+YMvImTt5/usK1f28DOwSqdk0L2MlkyoBkeEbC4M0b?=
 =?us-ascii?Q?YisWzvOH2z3epZj9yF+GgGWfBsVmphxYBAwu+Z8reGcb4btuPoqAbEBKW3eq?=
 =?us-ascii?Q?9xQTpOGCAa7uLgujLhVeiv0QHlPO2ACMWmQr+3hodI4XAKEYnqrn7LS/489P?=
 =?us-ascii?Q?OjbmL5mqb1jmKB6w3uCOvV8vIGPUzrDzS7Dw1yGUoXbFFP7qi6DmFpylM6J1?=
 =?us-ascii?Q?4/l/91I5vd6dM8rZB6R+BGNUG3HwAHUr+3T/Vzbq/vbN9YqON7iZ8XuaZBSF?=
 =?us-ascii?Q?q4J23gtcRrzcvV13xuRIKT8wCPRh9SNwGDwLNYragEjjaMUht6yuzzIuwnsg?=
 =?us-ascii?Q?Yokc3zsgFi0BbozNnzFM2MByqBBRwHP+g8ktIRcTdXXXUgUgJPjGlVXPu+Hm?=
 =?us-ascii?Q?Y23V+CklyscW1QbVa+D6ENMwWoSwUBJMOyBvdt2FjN//Xybk+zhxLGi5nT2v?=
 =?us-ascii?Q?P00LlhZPGir6wZjW8joX+jos/W8jwndtAWHcqPk4NuwGU1Vr+vFzEMS76BsQ?=
 =?us-ascii?Q?02FrranWdV6MKpLdTKh8SbAwR+oR2m3b7TR+L+9e4Xj3u8LOhEPu4YDsvnPy?=
 =?us-ascii?Q?/sWaoLKNFFQbyvr7W8Uoco/pmtKT0UOERKoarzQeZMwoiJ6JS+CuGOJfXzKS?=
 =?us-ascii?Q?teKx33UW7j0VrqbFJSI6xRGqU8nPtgtQ3SNmRu8BJKsOaEQkped43h+YJxbZ?=
 =?us-ascii?Q?Pd4DCrl9jc/rwjE5w/ADwm6388iwGkhLSuTyYDYJ4MMTafw4+DNDFIDxEzJW?=
 =?us-ascii?Q?qg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cAHPOzsInrlIzmqtYE6oGmkO98p3vVonYq86fdU9o0BCXP9Oh1RgR0iP0kQ4yW6kJkdkVNFA07QpVXh3XTFfa4hUSRq8SVvHuG+Yx7yz9MWfNOG2tXz1JAbQGWb90xLmmHVXtn6C2R3GFvdJ6NDOzPacDKU1y3bXpqUmvFz2EfaQt4+saYCF4DT8jbWpvy9Pn0Dq1xB2MPuLjWgFh9BFL4agm6xixgMllx0MIgrpf2333oos/y77fyeQ1wta0vfMFbhyzFG7oW1KqVoyYP74z3XXbz7MaQiqjrF+ZZ/Plt2boMmSnEdlTtLijQmpe16Y+Op98jHLlZ5vwGXLf4v5Ssg2CxRyyzmUe6Pd4KWag6++u1SWyZ9lK+uhIfzqOmdLOf7EOAqJ3j01wO4/LxeYpLa/HHIHg1V7LG9aGTNbgJpcvZ22pwlxr71CT5UhS1a/CfVfX4eZ7DxC2Ip+KULhmWnu3ZOONJbyP+Zk0x9r/qq9ZBthU19oCnVUAVB4/ELlUbRPEaGQAi66AwA23YqBAXqmduw6ATxZPPP5etcWhGsfEDQyick76X0AdKxvlob+UfpHpBOND2cEaY6lOs2qGmO2zZpYbiX7jIEdkV1Xf70=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7a967dc-e0a4-457c-14ce-08dcb33b46ca
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6292.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 21:37:15.2781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XXU1GdXgbykvpRq3s+sahcG1zxJXCrQRguBoN18nNmY+4IHJUc7XB1TN/9ShtN0YXlaFg4JN8uJ74wgQ6OGlS+hKGi3C33qcv7xFC/6Tf9s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7073
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-02_17,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 mlxscore=0
 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408020150
X-Proofpoint-ORIG-GUID: gca7OwM6ou-qT6-kGIo6ych8y5Pei2em
X-Proofpoint-GUID: gca7OwM6ou-qT6-kGIo6ych8y5Pei2em

On Fri, Jun 28, 2024 at 06:16:34PM +0100, Alan Maguire wrote:
> ...since tst.oncpu.d test passes now.
> 
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/unittest/sched/tst.oncpu.d | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/test/unittest/sched/tst.oncpu.d b/test/unittest/sched/tst.oncpu.d
> index d2c2ce57..7a33bab4 100644
> --- a/test/unittest/sched/tst.oncpu.d
> +++ b/test/unittest/sched/tst.oncpu.d
> @@ -1,11 +1,10 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
>  
> -/* @@xfail: dtv2 */
>  /* @@timeout: 15 */
>  
>  #pragma D option switchrate=100hz
> -- 
> 2.43.5
> 
