Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFBB3A268
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 18:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730141127; cv=fail; b=TZFtjzQZppIi4xLztNr6UOLlfWer/7BtRkCB1U88DZdm4t4OuTMUSlW9QOdHUenhQtJ3jyRYcFfVf0IcHDoQ14SWdh1j6am1NshflQLVEzYc4VE+jTThX27eQZ2M5ds3lonjquFZ87LTDtrIkbgpIahBsB1B6HajFasJud3e9lw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730141127; c=relaxed/simple;
	bh=f+HMp7r1QpmYyAY/a4RY8/kbIv7rV9Xb8+OZRNV4R3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kVPES30Q5uFeDNa02uRfIo7hMiK6VJmI2Z2iNTVFA1nd3XLacmAQOJ/+raRbJc+VdgA6WcjCJ0yWTfXGrBZ+avxs5LgM+s7WXrgu/pE455U7sJPz2a0AEI2ZIic3XusHHXJ+vgB02y9s6ZwoOtdRJl2F2VAXEf8qIZRkVab+TmA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TnYyZzIf; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=k0KWwaqo; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TnYyZzIf";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="k0KWwaqo"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SEtcYB021576
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 18:45:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=KzCCr8H5Zb3wQXldV9
	bu35dvswtciu92ZMPcm6xjP2k=; b=TnYyZzIfAZYIr49haaOBJ52nzD5T7d7dhJ
	2H7uCeV2TTQMoS9In+w0FOnoqKtSmBNP6Pw0XU82YNZBIUQGCXo+c3ERILaobKG3
	aI/o6gv2E4ClZMYvvzmk3avnPYhwhl01osWBra6Le6r5yY3WQMHKpfZ/aqlpPv3R
	N5T8yhzT6kHcUWXgKb8gDRQab8MemGUaXaUH/pmmgcfGxZRNtFjCRQGZvihc4O7v
	hAlLR6yRqRWNvItL+LgvEs39PKIK6kspLoHrqESN/lGqS/0wOzXSHcBXYv5NvyYG
	cDs2Fvng1vuUjZo/h1rvydkhKtbHnePnYnVezcuqdlB1B/c6JixA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grdqbm1r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 18:45:23 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49SI1R96011881
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 18:45:23 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hnab6rhg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 18:45:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cYSY0xG+rj0f8Vvtc23AAro7jOXVi6OA1F2263+4xnqfeq8cV0NxzsBVU+ki4dBZIsb9EeNAsMogIpOmJK1ViWsZt/geuExfkJcpGmiC+rOSCxsH1x2x18s/2+bpVKzNwSYQ34/l3ChjkuVmqYwz9vr6dayPrJWZn7oV4ioqpn+Atq1gj73Pjp7IuP0vTySa4/Uh12HCLvOgl1e5frqf15MhGFUOwg7rmKwbuBYtTf3tgI+nyHCetB/Tq1mtJr+1z9nQEC2aaAteV3mhaB4Sn3FfQP7jm9D8UmyjtpoyHmvE1L0AiP/Jp4Mtd6bAvMBYUSL3jF/1YvF9YTl4EToF0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KzCCr8H5Zb3wQXldV9bu35dvswtciu92ZMPcm6xjP2k=;
 b=whRN6h0T6HmloigDcqdLSVdC98NrVeo0RVqMtrx9JA/lKAlxFGpQ420dejLcunhzoAtCQOkW+9duoGMWrgUoIVZZQUMK/YMLB9wDB71JZVKDAAZlVklS3WjMT4hWED2RHcAKfjhH1deQYRPEUtBwODfoH34llROjBvD/e9P6dX5iE5HbnTZKnzdZVEy2lmS6OUFMEDeWjXvPqTgP52QYF0lVTqV1j8MKMK/E69WaFIyzbP67OxuPUvsnukaoGOCHS14EoZn5FM/fXDvB+hbxt+VLqE0f3SuQtr4SpHHSmXdt+BDy7jVcNA/5kdHHud/aNE3QpI/i5tiiB1w0qWLiaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KzCCr8H5Zb3wQXldV9bu35dvswtciu92ZMPcm6xjP2k=;
 b=k0KWwaqoFMZSDlzRT8hqMlkT5zhd0LysgmeNBkTHAI5azfIstHHczH3vTxhrBM6rgZs7u1tW6PAkfqmYbXxKfAFiiwtLdSnR2p8/eU8xo2cBIuxCeg8tfRsMJYXVcXZhi9UPGtROKvLhqSe7vFfgqCWPPQbNPxqMEJObZKnwjSI=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by BN0PR10MB5159.namprd10.prod.outlook.com (2603:10b6:408:116::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18; Mon, 28 Oct
 2024 18:45:20 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8093.024; Mon, 28 Oct 2024
 18:45:20 +0000
Date: Mon, 28 Oct 2024 14:45:17 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 2/2] test: Remove misformatted and incorrect @@xfail
Message-ID: <Zx/bvV1D79jbeUZM@oracle.com>
References: <20241028183334.22140-1-eugene.loh@oracle.com>
 <20241028183334.22140-2-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028183334.22140-2-eugene.loh@oracle.com>
X-ClientProxiedBy: MN2PR18CA0027.namprd18.prod.outlook.com
 (2603:10b6:208:23c::32) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|BN0PR10MB5159:EE_
X-MS-Office365-Filtering-Correlation-Id: dad46c86-ccd7-4ec5-a805-08dcf780ac75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YtIG3t1z70Rf+QQ5+zCIcqJw4KCsG/ulRWBzC5A6lQszwAob34V8WtRy6UWM?=
 =?us-ascii?Q?bZf/GaIwI85rBrzlLgzu4Tw0D9nMjKhNBtx7HUaphJG1S8nwPCCitPUkXGR1?=
 =?us-ascii?Q?7gpYLJH4YzIpRYAAYebc74Hjr8YiqRZHwtgeOrNc1VItkdHQG4e0nWgST+o6?=
 =?us-ascii?Q?LR7n87aaO20fByPuclYpXTjPZ1Gv/r5idE3pfrDlKaLFMFzhPWqOLKCLLNvR?=
 =?us-ascii?Q?rL3of/1FieRUgN8rxw5MRFFuqqh6GkS6Je5WhxRMlN34axiTZA9JDsILv9iU?=
 =?us-ascii?Q?/ZrSuw7g1+aF1Jyotb10/1Ojbtu7vyMLrNTqxT677XN55npxPxj9fSRAQ8dJ?=
 =?us-ascii?Q?YTkg7en+Z+Lxaacc0wdByUgjN9Qb3aEFjYMkACJYGoaNEKOi5rCQwZ7AsBc6?=
 =?us-ascii?Q?UGXb21FuljqFaMuy20+xU/9qtIItg/GOm3W4pP+ic2RfjHSdw4Rr/tdQ0PqV?=
 =?us-ascii?Q?Y1Uvr9BIRqZzEqeVRJnUAZeV2Wv78vAGw4EhGdu3BgchtNSwtWfnczOLdAXY?=
 =?us-ascii?Q?ycvh/tQEJ+W26NRa6en44R33DWOpc/KhipKxgex93Mnw7N1ug/yz7cxsG4Jg?=
 =?us-ascii?Q?PtmS5hkgysi+6y9WfkZB2W3bhMeHXyhaUHZGyB0bF3A44SXmRM6KgtbIkCeB?=
 =?us-ascii?Q?Ys8XMssleDKy5rRo5JWsjXobXd1UMJDbjJgiv5O4DalpatyNfJwAdJd245YC?=
 =?us-ascii?Q?2TEikSeNx41t75d9FPAXSq2SNqKfq52uWSAEvOGv51K7RFovkCiOCTg45vJh?=
 =?us-ascii?Q?I5Y5f24Jq2s19sGzLzlQvbyd6vOiQngecLcXUax//SeCC94Kvq76IJSJVXq5?=
 =?us-ascii?Q?6RGkrErOlFdNpShfjWhRsZzdK9nRcDRve07yEcUOcwoeb90EXJ8oBZonjGV3?=
 =?us-ascii?Q?JFKi/8I2juOp4Spl+FFfmQa5+9NBC6cCSh5obcdk8/hqiBK3VO0MFgnG9HxR?=
 =?us-ascii?Q?Aik1u0v5ewL1sw/cYRkSzxuo8vNxP5/2dnLC+lCPw4pa0ENdiEWq6zy0Iw9a?=
 =?us-ascii?Q?xWR77D+jxYUz3k7bmhJCyw4PEkut1BD+aJCWnBJWJbsXzA49x/RJ4vGpMbZD?=
 =?us-ascii?Q?EOpkyyqi3HWnSTNm/LNVu7gEXAJjiiB8Lxm/7HATvxgnEfRGl3csHG0Ksfvn?=
 =?us-ascii?Q?bGh0d1wqt8614/zOt7iWQzAmeZALOJTBKuWcNHr1QR+UhjqdJB1hhrbkEAno?=
 =?us-ascii?Q?EhYrqTdb/faHR+rfKGpS5HU7gq2fGhvyDUaP5EqZvvnU8ymtDlyM+gsmWeZD?=
 =?us-ascii?Q?LD1PvOX8GuTn1b+wOCatFUboGkDVbWzJqguzlTe7pVzbfBe7IR1ft+gpxWDq?=
 =?us-ascii?Q?mZ6jJldT1Uf0OuPJqzB59ty6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SXWVoHQPYLWtfOixab0Imc9FSQorqWsEEpZ1bIQIHnFUYUNDi6zkn0yoD7fW?=
 =?us-ascii?Q?J5u0ElOaXmqsDWIBIFr6PVhWhDivdygYHQtogxVa9UOTvpeOWqWSSjEyY4YY?=
 =?us-ascii?Q?xDW5AQixg9sLA9COKc0PvS/KIX2PNn+ktCL9ltvbQItm+RPniLyxTu2kYPFr?=
 =?us-ascii?Q?/Q1Oeip3N7Wqr/uVxfYLbQqfmEAvHzPz8ZOlIdOZe6NMIM3QQ/rUwMRIYFD7?=
 =?us-ascii?Q?6J4ed8kiUkK1D5J5XefKTiK8y18+lDHaoAC4Lnhlzl0jhI4Vf89UAvXk3oYw?=
 =?us-ascii?Q?6J1hCi4Wn4JjgVpNWTSBOohCjBKl8tOsOtLt5Zxbr+GWKroVLWdPFeuZ/d/G?=
 =?us-ascii?Q?wwc9upXZs0dozVFOfa/uHLm5fylv6k1ctVMY0pLjHpSJUMxDVR8b2nKqVtFj?=
 =?us-ascii?Q?/kclR7blKT/2/1cIUE38ALq3jbfk+wWy8eei/BUFsVlvthoyMr1fQ0cCZZup?=
 =?us-ascii?Q?a+4DpbF9iAc9WGblFKm0jaUM/kp/7gMOZ8bHLyuQu9VCX25Jdz8XKIqPLpto?=
 =?us-ascii?Q?BpKlJgaIAp0wQrk8IELG24G3CJ1o+lqncpVCP1ZYEyZ4u7NkHkCojVDo8kJS?=
 =?us-ascii?Q?C8tvubCI+wFxG4CZVvMd3T6FLmwZt8aQyKORivaPkBotlcjuQ+97lIVLMSyW?=
 =?us-ascii?Q?GQa/EI62jEOEIkBf6ZSFzNAeD0cerruuCyFcD1s8zSu79DnHnypZuVzr+qgY?=
 =?us-ascii?Q?Kse8OJELQVjMetVOVVw9a2eDvky7imylFw+Ty9qhPfBZ4klmnPJIlPblMti0?=
 =?us-ascii?Q?tjCke1ugzSkfHrDHZyWqKrr/lr4TAlbUFSTeoLanKldt1y0bFInrkBwXYUM+?=
 =?us-ascii?Q?afDiUIGWMstZkr26XQi+mWx3LymyxmJTOc4O9qt2IB9gFxQ1svm/XNIiOsIx?=
 =?us-ascii?Q?bgPtd/Y9G79ZhU8f76dSpMzFPykvfYnqX+Yw28XMiaz8OaxucAlRffjqilir?=
 =?us-ascii?Q?wjTB3MJH2QzI66TvHtsoKIQ1oZTiUASZYGfpTiBfVYE4q7d8xK2k4q6nQjQP?=
 =?us-ascii?Q?ziovXo4WEKzO87qvKDnlo36jfzbR/96/z2ivb0tTQZXlbpOk4Vm55rAZDewT?=
 =?us-ascii?Q?3mW41xV5dChgHC3izLww+XpddTYGqlYWgj0D014mMnTNn+/f4s9wc7o15iV9?=
 =?us-ascii?Q?Ez79NQbWbmYke8B6/DHnLS3ep9RyvmSLKnD/VETLsNasUitj8bXy6l4eWp9e?=
 =?us-ascii?Q?WvBoQvU+AP7nU4dAEk7BQHqEBZGc+cTjgETnO3jrVpQH/cL1qdaJoJkNUpKQ?=
 =?us-ascii?Q?oTgjD6T2box6iA0HBQkjjb5hLlGp6zsrgnSb8e4uLmK0teni8PD+08LBmyp5?=
 =?us-ascii?Q?lfko8MR/aVMXufZgC1tKRnMBB64/tBQADYceBPURydwEvMPKQbdH8EmBXF93?=
 =?us-ascii?Q?aAbf3fXCrZbAa27/+u/jeC8bWvgz3pETHZmRMDFKJYNZR/SDFQWPOMmRBj7M?=
 =?us-ascii?Q?HibLNeKsCDRu/RqfTQkU+FhTEHur5urKCLUnL2prMLqWU3pD61F2SdjBny5i?=
 =?us-ascii?Q?v1A9w3NUSHRUa5imR7zfDcL6De0IbN/4H0M2+B0FRDIETstdbRtp9RhA2pmw?=
 =?us-ascii?Q?J4f/CtpZN7v2a9W3GY8AUnzXF/SOD1cYKd+JPlgwUd/WUaevjo8Aq8vfPvs3?=
 =?us-ascii?Q?yg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/PBJjpi0AcrNsIavBJGCVXjvZ5FZavpaREQ5CmW2eBxNymcWPKREf1LqlXN54BpTxfWlD3L0CueXhgVz/5roE/OA2vW5qCJedsXJl23liBOoZkQhd6kPwd10hCVYFogGaO6gR16TyYlcBxaXpOiK9nv9xj0u5hbVnykllsOoxdWbbQtLaae6zZ6tvkpH+igTNYNO2TbcVFk3SiEm0V32YscERteIgXrQcRLzLVCzUkeFmNVCz/kI/JpVI+yHZ8SOKnysG2/B1vb3964u4y0yKeXT1V24Vd+Nbn3rlgdNUqm+N8ncXX9vWVENgTGhbSb0vtk7dUJFqu+Fe7r/IcrVjwaNRvb1d0I1eu+FItPWJYA1MtWLSyxluQYpIdF2oHXM2snpM/gm2gVf80Or1tV3IvGW+aGsEYzvE5ry3+aTy3ReAgNBPMyvSm6drRFFLXIqvqGYbXY8ui2lrnTFxrpjnV4oB4ky5P86Fe82bYnUc9nL5fGo1DkYLqXhjlWcZZYZV9bjfT9pRkJOJmMPgCYHuZLT7gxmE05X+h8+as/ZtRtCgGq6aSiMmoqikxVOKXjQEmTamjtf9y8Uvy4fKY/pPyufdvZejCJKJuzksFla7LA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dad46c86-ccd7-4ec5-a805-08dcf780ac75
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 18:45:20.1856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ZRvrYi4U/6lC16J9mKY/KwwOECvj9EXi7WsC8WuMbAROY0CFzH6CpnEpy5cpOlOtdfjMxF1tG4bm38yVojdiS2ovUDnl3cUTZISxxFmWzg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5159
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-28_08,2024-10-28_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410280146
X-Proofpoint-GUID: wtztyJ5tRjZ-54xxJLSbCZHphjrr33Zw
X-Proofpoint-ORIG-GUID: wtztyJ5tRjZ-54xxJLSbCZHphjrr33Zw

On Mon, Oct 28, 2024 at 02:33:34PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/unittest/begin/tst.begin-starvation.sh | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/test/unittest/begin/tst.begin-starvation.sh b/test/unittest/begin/tst.begin-starvation.sh
> index f8e473bcd..b3aa59477 100755
> --- a/test/unittest/begin/tst.begin-starvation.sh
> +++ b/test/unittest/begin/tst.begin-starvation.sh
> @@ -5,8 +5,6 @@
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  #
> -# @@ xfail: BEGIN not yet forced to be processed first
> -#
>  
>  #
>  # This script tests that BEGIN in conjunction with a high-volume probe
> -- 
> 2.43.5
> 
