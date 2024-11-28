Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D85042A81
	for <dtrace@lists.linux.dev>; Thu, 28 Nov 2024 02:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732760571; cv=fail; b=YEjL/3/Kr1FyYDOwbPozaTYhWYo2egaN1aOH2CsftK5v6MFqzLYzVSjVigYeOBxb6uhwL7O/V6QEt70NrMWIswhPS8qzIzQC0X4ITotWrR9n4HFXFKSpbE4oDZfnlQAhdccQiEB3a70TTyHQGyG65YUvCM/pa/DqX0DTY8qvZqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732760571; c=relaxed/simple;
	bh=6uGeKg7SJp0b5HdEhqSvLQOjT5nItvPploCI2DWNjcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TP6X6vDO4NrdBQdC4KMQEBEr1PhZJs0iWOOJuN6C1Mxhad0wkHE1Y3WeoK2ihofKFGgeqt0hkS0JnF80SuCPqRaryCSVk1o278jH0+PzJjCF77/TOVm9rgdeoSm11+ZD/EvD63bZ8Rn16mK0/a5JS0LNcEenm8vfOsvJnGFOoYU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=aUkJG2hF; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=PplM1APc; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="aUkJG2hF";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="PplM1APc"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ARICJRw002136
	for <dtrace@lists.linux.dev>; Thu, 28 Nov 2024 02:22:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=IusZh5BqgC6OEfSPbR
	ZrI+25ZhnQOaz9HeDLZ1I6+/0=; b=aUkJG2hFIYiDMrMXd+B+JhR8z0A7fvigIG
	0UCG76yOuziPplOzZpNSx2JrsCGrpNoEI8LXs2xSB3nuTVpL9tpg2s845PR3kaFp
	Hb58YOaHEa7LCTr20z9z7gGG0yekDyRCAI69ZU3zgFqU4W3BYMc2kez5OalJgGc4
	pX4JOR48ltrjfbuDHLrFEHdAg/IEyuywUG9NoOnU4A5y0s++dhV6T8M8+Obj9ICQ
	wVpfcomgPre2YcqAHIHSWTdb4g9iemnMtvtwy3stp3pNXr3KiyPJk0hG3+SlVlm/
	lBvLnbXXyemqWAvFyHsWKpfnvJZ+Qsd+a4vBgpIszYkelv/eGB7A==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4366xx8u15-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 28 Nov 2024 02:22:47 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4AS1tsEJ001322
	for <dtrace@lists.linux.dev>; Thu, 28 Nov 2024 02:22:46 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2042.outbound.protection.outlook.com [104.47.70.42])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4366yys3ad-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 28 Nov 2024 02:22:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tR9ea4uYb23pjrRbStoIqjrmZHe8B2QIyohvXSz9thClDl+zF2nkDId261gDoA5flHsiyhSX+oOVqjejIyxG0AUyH7gimALI6IjOenviKQ1FSWIfrxM1J62+mJIaOHNJsvhWjk/tXffRitDZVGg8USpY80frmASUlZZ0rR5PzX5Mn3R8NHqY5YhkK8TV7/mm4G9ZM5s4Sjw5QARPD1S44SkqJ2gf93lhSN0VWioWIM5R2xV+cjfxsW2Dvw+uhHh11u4HTr0k6qxOeVYUd12dG9KhGJQKBd0sKRzUkRjDPhGwXem7lXBQ8P+CC4m+PmDKvE3EsO/OkY1jhtivPwJZaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IusZh5BqgC6OEfSPbRZrI+25ZhnQOaz9HeDLZ1I6+/0=;
 b=b3pH6Ji8z1YGu7aQ0pfzwAR24W+yZz+J/lVGew4KqaX9O9zVJJdGGeUDNSkE9r870vIMgOyTgXBl/Zi7lnD/t6oDFq2ZPd6juqMQBifjLo7+58eJjcSQw2Lixu2rfT1pOMADSsjY2S5W/041p4WrTfedlRRnIh0YPfmIs8mUhLoFIk7TskoNp+Bd8nAj58JOZdJlflndyPSgYIjZJsCawt94iy35QJ0Nfz+OOW7u6sUiTHcnk842fyy1ZIuxMkIEX7hUPw5UciXK23pDrXiO8mZWv+2vozb1p/K4r+x38cCGojrcIweX6DMRAEOCZSaGdvkxVIBUdhcuU+QOvf9eJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IusZh5BqgC6OEfSPbRZrI+25ZhnQOaz9HeDLZ1I6+/0=;
 b=PplM1APcCHReDTjLnYeHnUxWEq1FwJpmmgGQGeGocpEsdoBz7e3b3DLwb0f6rnDS0WVSviSdWU+cvzg9HQ/8JHcvWXBKdAeyjU+idwGtnIvUL/EPLLK8y+evS15M31JVzoEefNjRsB703t+g1mljcUwkK+Hd8bweIuU4/d6YYto=
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com (2603:10b6:a03:478::19)
 by IA1PR10MB6807.namprd10.prod.outlook.com (2603:10b6:208:429::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Thu, 28 Nov
 2024 02:22:42 +0000
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe]) by SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe%5]) with mapi id 15.20.8182.019; Thu, 28 Nov 2024
 02:22:42 +0000
Date: Wed, 27 Nov 2024 21:22:39 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v3 dtrace 2/4] fbt: support "."-suffixed functions for
 kprobes
Message-ID: <Z0fT74qN3NPCoyq1@oracle.com>
References: <20241016155409.4038017-1-alan.maguire@oracle.com>
 <20241016155409.4038017-3-alan.maguire@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016155409.4038017-3-alan.maguire@oracle.com>
X-ClientProxiedBy: BL1PR13CA0437.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::22) To SJ0PR10MB6350.namprd10.prod.outlook.com
 (2603:10b6:a03:478::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB6350:EE_|IA1PR10MB6807:EE_
X-MS-Office365-Filtering-Correlation-Id: bffd2fbe-4707-4699-fc5d-08dd0f53899a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EStiod0wAboCC0iG+G0FUaDDrSvoEKzEMcIgoinuoNrtQt+HQSEnlnr5XWL4?=
 =?us-ascii?Q?A2Z47iKHLDjuIpwfEKk5rsNIjG2tNMtF1115H/cLP2t1XgDDThjvFskKBG4s?=
 =?us-ascii?Q?v/ZcrB6H20OkE2fpwVzLo9mTbY2POnQpWlki3a4LV/n951LrUr+bPM+cOBsg?=
 =?us-ascii?Q?hClr6sULJgt6KqIToSpum9p9Ys+49gIZLckgIuoOdz4kghmR98QtMbbXvZpL?=
 =?us-ascii?Q?kNF6Zxq0dXWcrOUKbdh0iRaGv2Ovn6XbBUIkOO6rUwetJWYRloRBb5mHMKl0?=
 =?us-ascii?Q?VyeDWtsp/FVeNFtCXR8wJ7y4ZICIi3gSgsVGPRTLNVsyVxqDsgCrVGqIGtlm?=
 =?us-ascii?Q?XuRg2TRoOOus/tWDsrBWJGzNWmGxJHVewjoQtL5EZ29GbNDl3M/IvgI+5YF2?=
 =?us-ascii?Q?0AqxbaoT6MdqADYZ/IC6ZAAc6V3mgBGb/MVBKq+yH+xdHICxKJ6DPqx6eo9L?=
 =?us-ascii?Q?rXYfVQRstbhsqh0JF+Vz+mV+yj/4zGCyQv8ayQNxtxfVaFE2cbHOzfMgV1Xb?=
 =?us-ascii?Q?YfEQQlf5dL8cl6ermG6xFYwNn8tcd4dDVkn15wFmxZRfKZsdq8Jxg770MQjv?=
 =?us-ascii?Q?dQF9/M0FPkFF7oa7tcioUUR+FgxSOVD5yfVrHC9pals9CsytCyGlS/XlM0JJ?=
 =?us-ascii?Q?dKI/RJ0Uh8ilTr4KkHArd6lT+PsD17n7xUzY8CG8t7+651GnmPZhS4m5DtJK?=
 =?us-ascii?Q?tuDblAU7v66o3zobU2aFKFmbCVyB+Y/v2Ab+lOXXTRizyscfLEB4Z11hu3Av?=
 =?us-ascii?Q?C1rLZSbGw5/O8XGeeR0gX9W3gyVh57uvfkmODx5VAPE1r762PHMCo/IG9oDa?=
 =?us-ascii?Q?J1JGERUwAy6/cSC+dta16WntJ8FEOpG6DhkB9brqqb7y0JEB2hA+AzGTMKW2?=
 =?us-ascii?Q?GAc1HVuHHESt/KH2PTrx79jqNmD+2Uehn6YZaJI4UsWGxNz2ZoHCo6+aWX2z?=
 =?us-ascii?Q?U0BMfdLYWG98hDCZdKAfH+m6XAcM8rUisn/wPPwKm/iKLJkgylPWRLNmwHvD?=
 =?us-ascii?Q?RLFJPdCFbegyi+KU4dvt0Uhx4q6dwXZkewfhYVhheCG7SSinMzDmgVJkeiYc?=
 =?us-ascii?Q?fDkfQgViABJ1d2FCAFGinYMQ7KQ21c/x3wTNsXt8UBSk2PCKBvWy2350FeQq?=
 =?us-ascii?Q?khyB/yeDhZtkdii+JdXBSIcNabpZERLNwK1Uz0ijtvRgRhMHa7FyRQjmg9++?=
 =?us-ascii?Q?uKVv2Hw6/PrABlkT+rkTIWjpntJWizIfcUaOvB5AcTrs0tI1uUoKmKPb2hUi?=
 =?us-ascii?Q?TzP/Lpql2PasMfWHCvK55WUh+8IiL0dMzTn6O/0va6fYRLwP4rbfM7DtWvS0?=
 =?us-ascii?Q?IzcDJ3hHLuzCWxmBsGnsl8Q2bq7d69dieU5qtUKspuGGcg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB6350.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4RIIPuQh99cH6fgW3gtwKGqpfC0LmEA/FdY9E3a3jNg6EwEy+U806r80rL09?=
 =?us-ascii?Q?ez0HtMCAmqENJBHTkBoZTGQ/Xlsn2UrUGtQ0LICvICRbZtgAhCNIfsGUKSOG?=
 =?us-ascii?Q?Tln71b8vGORFeqTqQOkz9/8Q52IPeuGK8fuzvLK5O15LACM8OzNSd4lsesCE?=
 =?us-ascii?Q?+8rWb2dDPBKiAOhxrQqFLiV8vYGYjgNpe7Nzw3gClLURPVGKB7L2/buwtZW6?=
 =?us-ascii?Q?D6CHwvdECa4Z3jqB0wAjVs+1ACp85XhaMlVQoqcf+mOZPQdrKyjzaGL5Y+71?=
 =?us-ascii?Q?GdoUSmm2Lhp3KKc0QwicKZhnnS7uvuZIscyjvbyvEZ4EFyIp0Tx6e9YuMWAi?=
 =?us-ascii?Q?0VGJbH1HobsulvlfEi1sh3yCzI7GKOFCtCHnULO4fIFBNyXli2NJfnMU87l/?=
 =?us-ascii?Q?YamPE8c2SXm4Ys0G5ERmbfPSYi3P8oNZyu2vwJwHpfiZU1fg0qCnaidC64iw?=
 =?us-ascii?Q?OWPc/xaDdgEUllyac4HR3j/PYDn49o1TLU45Ao4KBus3VTB+kb+22dc8B1Vw?=
 =?us-ascii?Q?v0WidCKzuk1esPzjg3Z7wJqUrOhL+m7vpnxBnw0dVnMFxm+VZz6CNMXwDtW4?=
 =?us-ascii?Q?pl4mrgZdbqjtiJ4yI8PEQpYg6o+ZHR3Pa3Q3fQe7OgwkWshg3x/caKj+RIG9?=
 =?us-ascii?Q?QB5K1mONHV+PzYacwQtgb2I/YlKJoIDpVOVF3+CoMxMa3nVhSXdmeXce1/Bk?=
 =?us-ascii?Q?mzBW1GCR5jxkNF21czg+atfOSmya7d6I7WPa2fh7vrq/FDakCzdO/lFbGjGI?=
 =?us-ascii?Q?51FH6EoHFKbNHo1Fjyn/koqe569k6gbHC5YO0JychObZRVVgWeUdvY/xeSov?=
 =?us-ascii?Q?4xdRPYs7h51iGCc7XuCo05Mr6KV+kDlrVmUG+GsIDRLUm/wkOiIvUqoYt+Ev?=
 =?us-ascii?Q?IjZLxVzl/V6RGdm5XrmRgozx57Y7FkDMutDb0/GsuVyBOrbpngm4KvoVkZ9B?=
 =?us-ascii?Q?QzVDOLt/hZzEE3mB8O25lhdr7Kxnb2HleRqFjFY2ymz7PntFkogmH1bi5S6K?=
 =?us-ascii?Q?F3jJFi/BbquoiDm7RmNCLz1nZOmgKaOVfY+OddzbPWUjzKNAYdjxtzVOxbbF?=
 =?us-ascii?Q?Mr0xbIKoFpmtM8/tqY3U8v44aBxhfkArqWBTYn90WyJLUUyx5BkasUDWiFKv?=
 =?us-ascii?Q?8EaYrGpoHOhyKQwWusa4e0YCQhCvoJuYSQlHnOmO/diSvPBE1nz1wD+zKYxt?=
 =?us-ascii?Q?jAiXCVOptmNc8FxnztN68UommNYnn6l+kqsjirN5jmguej9TWq77hbSx9XFM?=
 =?us-ascii?Q?SUz9OeMg2jOn1pyDGx8vGfAja/umROeysMLjwkO4syZThAinK71AGkHhDLVK?=
 =?us-ascii?Q?W6gIxGc1cPk/RjLfkrSUhhavixOu1FvIVoWBlVmFvo3LcFYc7shfidN9uKBD?=
 =?us-ascii?Q?GWvsHEzSPqvlFXCCy9FADlM6LLxSc0UPpUkee+QPYCtQu8jwZXHOB1PCQe9I?=
 =?us-ascii?Q?Xz0nAp6gu3OtMy4fYBsXohnNCz38OMdMVpm2Oo21k3vu8qonfr3IbUQ2xvPd?=
 =?us-ascii?Q?pB1AhImKXPSiJsPo1HQqVVDEXlNyriQozPRER+7IO8cws94loBLvaTnMgmIH?=
 =?us-ascii?Q?A1FyiBJ1pouvgkOVG4DfP/VDlJn+LHAd2s19ajZ/3yUHEfSe7nk7ES9ap3Em?=
 =?us-ascii?Q?fA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Hz0LTHQPuRrAlGbVEIe35tZNbujcCyuU9TVD5SBa+705oj1nDINYDNFwZfFnipHOqDnEHrVOXp5CCVUJ0DG9joX/PxixiGvNl97WXzBsRs2/eEZxREJjdwiqkvyKLXwtDlBXGEyQy6z7J2pVXQ81mHpxdApl+zKF3nscvQbiwK/C101kiS8lrBjvDweb8e5slMS4KOJ5rSfh4tafQA9/1uspeXNn1wvgYsZmjx4CMrTPMc4fNv76K12UfkZdM5B3xu/LcX+puWbDh8+35PC3qK4CuYYSRJh9DmWeohuK+Xdl+pAcy4u9kjTnWXxvg9cum2gGcZu7fZzpxILDR9uFIDE31M4qWmkcQSnFn75BoHCd9SvZl1xFcKTd+leYHbhsQrvAELR5DAr+udzXHwogsudWi1wFtA0+yssg+OvpqjV09AB87dQJCczcN2B9kONz7HmEN0XAHmh9Y6ST7tOj1meQoypGF9FnLMZE4c5NbWt0722KK0+IDOeiZ2w0EZeS35gDNbL28Qc457hQAbSJL2iBVdkUKSZ/tfamvyGrWuBPOBqqEci9dVhoJl8UWNYF2MtlBVoECrKYCl52zM7+1q0Y1Na8108VgQYNJpIVOr4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bffd2fbe-4707-4699-fc5d-08dd0f53899a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB6350.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2024 02:22:42.6149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kQJVerpOWTyO7rlyteTzkNTKO+y59WvL867OUPxPxaM0eo70VFZi981lo5ogc5MTBZifzL8oRSLyspxKe1lrsVjWSurykHLx/PfvJ/BvesY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6807
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-11-28_01,2024-11-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2411280018
X-Proofpoint-GUID: K1aEJjXCUeWfx4Wra2Bd3x6GjkAevS94
X-Proofpoint-ORIG-GUID: K1aEJjXCUeWfx4Wra2Bd3x6GjkAevS94

I am still workimg through these patches (and writing some additional
support patches).  But one annoying detail has come up...  kprobes do
not provide argument type data whereas we do have that for fprobes.
So, if there is a function (like find_bio_block) that can be probed
with fprobe and there is also a find_bio_block.isra.0 optimized form
that can be probed with probe, they *cannot* be represented by the
same DTrace probe because one has known argument data and the other
does not.  And it does not seem safe to assume that the optimized
form will have the same signature as the regular function.

Even using the dependent probe mechanism won't help here because that
is based on being able to convert the arguments of the OS level probe
intp arguments for the dependent DTrace probe.  But in this case the
OS level probe (kprobe on find_bio_block.isra.0) has no defined
arguments (i.e. they are unknown - lack of prototype data) yet the
dependent DTrace probe expects to be able to populate arguments.

I think that the only way to really get around this (at least until
prototype information is made available for the optimized functions,
if ever) is to have two distinct probes, and requiring the user to
specify them explicitly, e.g.

	fbt::find_bio_block:entry, fbt::find_bio_block.*:entry

Another option would be to introduce a fbt-opt provider so you can
write:

	fbt::find_bio_block:entry, fbt-opt::find_bio_block:entry

or even (although it might conflict with USDT probes):

	fbt*::find_bio_block:entry

and the fbt-opt provider can place kprobes on any find_bio_block.*
symbols and they all would get reported as the same
fbt-opt::find_bio_block:entry probe firing.

Thoughts?


On Wed, Oct 16, 2024 at 04:54:07PM +0100, Alan Maguire wrote:
> gcc adds suffixes when it carries out optimizations, but often
> these leave parameters to functions intact.  Many of these functions
> (like finish_task_switch()) are important for tracing (and they
> are present in available_filter_functions so are traceable) so it is
> valuable to support probing them.  For kprobes, the probe name removes
> the "." suffix, so store it as additional tp event data for kprobe
> attach (attach time is the only time we need the full function name).
> 
> fprobe does not support such functions, so the kprobe impl is always
> used in such cases.
> 
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> ---
>  libdtrace/dt_prov_fbt.c | 76 ++++++++++++++++++++++++++++++++---------
>  1 file changed, 59 insertions(+), 17 deletions(-)
> 
> diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
> index 21f63ddf..06ea78ca 100644
> --- a/libdtrace/dt_prov_fbt.c
> +++ b/libdtrace/dt_prov_fbt.c
> @@ -21,6 +21,7 @@
>  #include <assert.h>
>  #include <errno.h>
>  #include <fcntl.h>
> +#include <port.h>
>  #include <stdio.h>
>  #include <stdlib.h>
>  #include <string.h>
> @@ -63,8 +64,8 @@ static const dtrace_pattr_t	pattr = {
>   */
>  static int populate(dtrace_hdl_t *dtp)
>  {
> -	dt_provider_t		*prv;
> -	dt_provimpl_t		*impl;
> +	dt_provider_t		*default_prv, *kprobe_prv = NULL;
> +	dt_provimpl_t		*default_impl;
>  	FILE			*f;
>  	char			*buf = NULL;
>  	char			*p;
> @@ -73,17 +74,25 @@ static int populate(dtrace_hdl_t *dtp)
>  	dtrace_syminfo_t	sip;
>  	dtrace_probedesc_t	pd;
>  
> -	impl = BPF_HAS(dtp, BPF_FEAT_FENTRY) ? &dt_fbt_fprobe : &dt_fbt_kprobe;
> +	default_impl = BPF_HAS(dtp, BPF_FEAT_FENTRY) ? &dt_fbt_fprobe : &dt_fbt_kprobe;
>  
> -	prv = dt_provider_create(dtp, prvname, impl, &pattr, NULL);
> -	if (prv == NULL)
> +	default_prv = dt_provider_create(dtp, prvname, default_impl, &pattr, NULL);
> +	if (default_prv == NULL)
>  		return -1;			/* errno already set */
> +	if (default_impl == &dt_fbt_kprobe)
> +		kprobe_prv = default_prv;
>  
>  	f = fopen(PROBE_LIST, "r");
>  	if (f == NULL)
>  		return 0;
>  
>  	while (getline(&buf, &n, f) >= 0) {
> +		dt_provimpl_t	*impl = default_impl;
> +		dt_provider_t	*prv = default_prv;
> +		char		fun[DTRACE_FUNCNAMELEN] = {};
> +		void		*entry_data = NULL;
> +		void		*return_data = NULL;
> +
>  		/*
>  		 * Here buf is either "funcname\n" or "funcname [modname]\n".
>  		 * The last line may not have a linefeed.
> @@ -106,10 +115,6 @@ static int populate(dtrace_hdl_t *dtp)
>  				p++;
>  		}
>  
> -		/* Weed out synthetic symbol names (that are invalid). */
> -		if (strchr(buf, '.') != NULL)
> -			continue;
> -
>  #define strstarts(var, x) (strncmp(var, x, strlen (x)) == 0)
>  		/* Weed out __ftrace_invalid_address___* entries. */
>  		if (strstarts(buf, "__ftrace_invalid_address__") ||
> @@ -129,6 +134,31 @@ static int populate(dtrace_hdl_t *dtp)
>  		} else
>  			mod = p;
>  
> +		/* '.'-suffixed functions (e.g. foo.isra.0) must always be
> +		 * kprobe-backed as fprobe does not support them.  They
> +		 * are represented with their unsuffixed names however, so
> +		 * the full name including suffix is stored as data associated
> +		 * with the tp event.
> +		 */
> +		strlcpy(fun, buf, sizeof(fun));
> +		if (strchr(buf, '.') != NULL) {
> +			char *suffix;
> +
> +			impl = &dt_fbt_kprobe;
> +			if (!kprobe_prv) {
> +				kprobe_prv = dt_provider_create(dtp, prvname,
> +								impl, &pattr,
> +								NULL);
> +				if (kprobe_prv == NULL)
> +					return -1;
> +			}
> +			prv = kprobe_prv;
> +			suffix = strchr(fun, '.');
> +			*suffix = '\0';
> +			entry_data = strdup(buf);
> +			return_data = strdup(buf);
> +		}
> +
>  		/*
>  		 * Due to the lack of module names in
>  		 * TRACEFS/available_filter_functions, there are some duplicate
> @@ -138,14 +168,16 @@ static int populate(dtrace_hdl_t *dtp)
>  		pd.id = DTRACE_IDNONE;
>  		pd.prv = prvname;
>  		pd.mod = mod;
> -		pd.fun = buf;
> +		pd.fun = fun;
>  		pd.prb = "entry";
>  		if (dt_probe_lookup(dtp, &pd) != NULL)
>  			continue;
>  
> -		if (dt_tp_probe_insert(dtp, prv, prvname, mod, buf, "entry"))
> +		if (dt_tp_probe_insert_data(dtp, prv, prvname, mod, fun,
> +					    "entry", entry_data))
>  			n++;
> -		if (dt_tp_probe_insert(dtp, prv, prvname, mod, buf, "return"))
> +		if (dt_tp_probe_insert_data(dtp, prv, prvname, mod, fun,
> +					    "return", return_data))
>  			n++;
>  	}
>  
> @@ -363,10 +395,11 @@ static int kprobe_trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
>  {
>  	if (!dt_tp_probe_has_info(prp)) {
> -		char	*fn;
> -		FILE	*f;
> -		size_t	len;
> -		int	fd, rc = -1;
> +		char		*fn;
> +		const char	*fun;
> +		FILE		*f;
> +		size_t		len;
> +		int		fd, rc = -1;
>  
>  		/*
>  		 * Register the kprobe with the tracing subsystem.  This will
> @@ -376,9 +409,18 @@ static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
>  		if (fd == -1)
>  			return -ENOENT;
>  
> +		/* If actual function name contained a '.', it is stored in
> +		 * tp data; use non-suffix name for event as event names
> +		 * cannot contain a '.'.  User-visible probe name does
> +		 * not contain a '.'.
> +		 */
> +		fun = dt_tp_get_event_data(prp);
> +		if (!fun)
> +			fun = prp->desc->fun;
> +
>  		rc = dprintf(fd, "%c:" FBT_GROUP_FMT "/%s %s\n",
>  			     prp->desc->prb[0] == 'e' ? 'p' : 'r',
> -			     FBT_GROUP_DATA, prp->desc->fun, prp->desc->fun);
> +			     FBT_GROUP_DATA, prp->desc->fun, fun);
>  		close(fd);
>  		if (rc == -1)
>  			return -ENOENT;
> -- 
> 2.43.5
> 
