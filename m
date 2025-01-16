Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFD914901B
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 22:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737065414; cv=fail; b=nfXmAheVJG/ixpPYO3lJLFFtmsWRcGlL4onv2fnVb1BUSZ7tLomdCFXV8fwDewFWVw9iUP5TKk+Nmh96ez9JNfkVxDSFK3LJ62BRrJSGl+JSbX59tGub5PXw0+kvDZ1DmV4Ip9xptWmNtM6xDagnjwz1xOHowsvVwLtKqxn9GV8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737065414; c=relaxed/simple;
	bh=LnIWB+gHeqxK+fezQ5Hub9+4bZbEDcloOSK0LIYGhTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MJ7DUPB0buyn7Q4gIo0f/GkFScwCvaRGoOx4Fpmr3brq43/Og5Djnz9dLJ/pC6xA39FiosNx5GJ7CgIjvbGxwwA3KGi8t8jLsDeO4cQ7cGILljIHIHuY4EChDdNxm/aOWk7TxGARd+Xod2a6zVXateTBeNdbzOyjxsuvLvwsjM8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CynF4VJB; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tfNccinh; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CynF4VJB";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tfNccinh"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50GM4Yfo018484
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 22:10:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=rNkGifaCc3UbK3K+cm
	5aYsqQg9kwrNfF9HljC9ME1g0=; b=CynF4VJB5TQlvGECWUMiiNF3AcmFOivwAo
	fZgGYwiQiH4EwQLX33zHpKSTr//isGkwoMuFPLIFSE+oGJqTt2eOSr1WL1+GjRB8
	vaMvaQjmYCNFgSX3+9sGa0XaHa8WWbsj5yX+Imiv6dSiQ7LJzOegGgNIHwrnCtt4
	xKa82CCJvw1/u5pcuzGvfSqs8HtCZmIoRvTMtBGESm/TbmciNsfEXzsiDbdW67yR
	LxjrTwKICRTsC1N1R4WHXmHkCG6HEIEbCxxOO7nkMRaNvQUngCz3BZq7EyEknYoa
	emdhJPVe7rORkK6E5WQyCkvRn5tVUBHvp4CUFwdEKzObXkT1uf9w==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 446wtp9njh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 22:10:10 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50GM5Ede004616
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 22:10:09 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4473e5k7e2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 22:10:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vNytUR4nypAMBNJZFaPhWmlpnKxBMEkMXLVI60eOchTMMj7oVZe+4AYFwIWdQgUn0vrszZu9rB8SX2zWqbI2yvIHh/fyOKnrpqUjvkueERNbFEOyMEfvkOt7hOnTAN3ydgjDGLFeExL+WPv9I1dGGuU5aevEhryCTZidtkTvI0BvgRI1f4FaUoeANqoVd0kXa0elssQwEhYFvaO7F1dzpP2LXRE1kjnyVnT4aEOmeBqjD2LGlOHWsi1OxxmQ4m5wRfLvjbY0FoEyAG2Ydeuw3RhTx/RgQYzQWuNNOmG5/fRm77Xc8qHwW7hFJHIXKYYWORQSl3DdWE2PHzhAav+QdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rNkGifaCc3UbK3K+cm5aYsqQg9kwrNfF9HljC9ME1g0=;
 b=yO7ty8idPXetEdnIEXIPAPqjMfn0jRhGWSQE4fwqnsy3gXIKY5xrm/Eb9WiwQ92a3fONZJm04HOxeipCz3gvvsyIUzfE6CsTH7VBuHNdCOwWxIIIUKArvQ7fPWoPMaG2fbYR++4sYukQGSFU2hvr4l40nqLWrGToZcZyL22mMPoZ8Tzf+HpDwagv1k3bQUPqhu3tv8sYdA297X9Bi9omr3Nv1uEdBFvbPq+g9v+Mqk/ag16fsOdxALyhVJpy0RSJYHz9MbDsP60ofRUQPt+v9qUxh+ALcYMKLcoAy5XPexV8IzxwtCb24iXFx3N+NzVZX5IfR7OfZ6txE0mNyqnD/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rNkGifaCc3UbK3K+cm5aYsqQg9kwrNfF9HljC9ME1g0=;
 b=tfNccinhVo5MnQAv4PT+FJkICNZACVXMZgHrSrG7KNYtkVxyBhYyybLuim2VbAV2tWhoOh08sU5oCMWfo/BmtiE3pwFavZribJ7MgY9XxtSifXXQnusi2BH4YlImQHSSDCMhzgfRAjKDp2VzQL+OVUpjsJrFpQ3lh9/IJx33GGg=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by CH3PR10MB7162.namprd10.prod.outlook.com (2603:10b6:610:122::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 22:09:59 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%5]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 22:09:59 +0000
Date: Thu, 16 Jan 2025 17:09:57 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 2/2] libcommon: turn off FORTIFY_SOURCE more aggressively
Message-ID: <Z4mDtTE+jlAm/hQy@oracle.com>
References: <20250116213332.415905-1-nick.alcock@oracle.com>
 <20250116213332.415905-2-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116213332.415905-2-nick.alcock@oracle.com>
X-ClientProxiedBy: BLAPR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:208:36e::27) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|CH3PR10MB7162:EE_
X-MS-Office365-Filtering-Correlation-Id: 077e540b-2731-431c-9bb0-08dd367a849c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+K2ErVfPXsb9659pw1UIfOd0UmpFmQNYGPLQLdAokSZDcS+3qeWnYDBGBLML?=
 =?us-ascii?Q?Vp+dc7Ku2d+9lJiDFsCJSisjCea8QGUklSjIEYtN/9CHPUIjLjAVA5pQfgDi?=
 =?us-ascii?Q?wbVnezJvhX0+Sj0ha0Wx7CNIDdPbcSOLl7NROLMVkzPa9Kf8eSptXg867xlT?=
 =?us-ascii?Q?yIFt7RjfQR7j/YhASEgqE17kulVhm5SV7JnZzRKn1JrwYOF1y0iNlIMA81P7?=
 =?us-ascii?Q?Ei6z1vy0VTzfKMs5IbqzVUVC+DwnhA3dFmmTohz8aCNDVJaHPQEfZPccWJpJ?=
 =?us-ascii?Q?Y5MgZKBBteiAViDS2EgAmjDrAmvi0nYEaZE46cYc0aoksKILbPKwr6lDvlpn?=
 =?us-ascii?Q?xqXcKqTJhlFviasUnxXekxFQbSs6LWymauzGz3qLD6SOXVolEbblgK7ZDE4P?=
 =?us-ascii?Q?tXAV5mnPM7n+2DwoW9OHzCSdQ1qytavhpubOstxMf2x9sdO9SVRkXYBG2ty4?=
 =?us-ascii?Q?s3lN1X73PXUuqhSK67R4W9wJ9kRGilIAbDDnhNFoD8Isc7foPJLze/jYTC2p?=
 =?us-ascii?Q?hRAXfQneRDtSFNosLxnnl05LADIZKyghs7pznCROv18cPFcKDDmTLM7JGU/B?=
 =?us-ascii?Q?RSlk0Ilx3cJgtrlxxoTYUT2GwRHiMShLOuSm2yIf3nSbYmIcjWgJr0qrdZq7?=
 =?us-ascii?Q?+Y5T3BaJqcIXdpEBq//DhSQVd5QmHSUBk4CyrJf8xo2EJ6dQHc5xso40ugDi?=
 =?us-ascii?Q?qXPt2p3ZCr7ZE2KstRge5FAbnOa/PlUPtcweu/i7hKQmpvytAC8WQWCOXnz8?=
 =?us-ascii?Q?qupWXT8zQGeE23tf3GV0OJ6cYUktFGpRs65yabmStVfzuhUdeFjU0+4+4EUj?=
 =?us-ascii?Q?3jFQ8aAC0sshJ/Ms7cfPvBX++YVwu820szFGvp5zttT3SMxGOtJO73/O5Tth?=
 =?us-ascii?Q?W7cELWTmKxayCqCNrz5wPjtMaZA7oZRN8tEIUw2BnNRCqwSNLGFwh8Cnr2vy?=
 =?us-ascii?Q?l/kl9TUM+3eeddk5L8JmyiQefEmUIxMRhSFYV0QRxdL5Q49J/lqkL8lpVy7u?=
 =?us-ascii?Q?v8A69yWlhMhlWAARiEb1HUlubYKIrXMTsYykLzbrr2Me9nzssLm/74W1zsRt?=
 =?us-ascii?Q?PUq+25jd7RwAYfC8kYu3hupFQMBljbbSpFxfMKOSPIX+o416PtYC3INlwhcI?=
 =?us-ascii?Q?4hd1c/50ZQTj9fzSdttnpapVAd5uEpYTcgm+E1UrehAOOsJPhGvgV/JRhCPL?=
 =?us-ascii?Q?QDToGnubKpObxnphMfY7xh5xd/5jwzQGtoB3fQz0NTwtPIOmUMBqHe/bEExp?=
 =?us-ascii?Q?2iX/a5ELFCXJYXMfXZEmwYZDMmd6YvgZiaEfRPMtP6TcFxF2T+BxnzQVK8c9?=
 =?us-ascii?Q?sTLBLPCn0vSTDfGRM3T0AxP272cgf/QkPdwsC/lv1XK+011C5BYv96zHNtdW?=
 =?us-ascii?Q?kUgQgjpVDGfo74o64BUOxbBv4EPw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PTk7fuO6K/aFZyYAu1c384ReXoXWjG5Ru4k+0bLNjwwPU44Cp2BhIWhwsWis?=
 =?us-ascii?Q?xmd0lc3e5vxp2y3kgx2q7r4iEUb9XOZydxNf+3Cyd3SyOY9SQOiqF86YIasm?=
 =?us-ascii?Q?dlY+Vc4ceDG+4Unaa+Sf2h4ceAD18c/FfdSxOXUboThMD7DblFV3Cq4JaV+k?=
 =?us-ascii?Q?Cl+5+tI3k14nv9VqOWNcUS+I2IYitRK+ULnqsYiNG+NThHXH7pFSUX7hiihr?=
 =?us-ascii?Q?UACl6pMkKujoRklro3scOiWyM0jHa0YyDXzCXof5P58hw5u0Jhve1blS4P1f?=
 =?us-ascii?Q?l20uOSrpBcBQMQ9xWNAar2p7XX50brFAtimcSRgNAk8QAC1UPPRwj/8qBKGu?=
 =?us-ascii?Q?XTt0/GPfOI9q6Ya6jpzjFEEOaqD3BTQg3Rv5K8VBK6cfMJ+0L+JmdHe2PPs0?=
 =?us-ascii?Q?eDDCu8/VT6KwESQcnvJojnZHng2VrBxIaQPXMG9f232zHHgYc4N9KNSYjcAr?=
 =?us-ascii?Q?FhnW0y8HoOkrF0j34vHWAudqoPBMdo/DS6r8oFMYmNYpkEEh0wJO9t5H4yR2?=
 =?us-ascii?Q?0PBk6u4R+qjw2afvWdS4MbhvRRus6q35mJrVIRbntQNp6WrgTLSIytPFgs7Q?=
 =?us-ascii?Q?UZH6iOR+FQwWB0NgWZvyAAqQFH1fNnu5FcJ3LtO0yZ8a9+4YLt3otRD3DmYF?=
 =?us-ascii?Q?4nfjpeODZdGpThg4Rp41cUofYFHrk3KzUr0KtTHQX5CMTLZRUJ8V/cI+k1JE?=
 =?us-ascii?Q?8A6iH8wSezkp2iHSlQzZIZEu9/jFJOLEwtCPxa5eYf6wBle6VNCqPsIBZYeB?=
 =?us-ascii?Q?97JvtjUwG2eOL4gfgJozPQXeUSMDC8zVzA9sxwbuhsyM6ZfYo8Piyvn5GRrH?=
 =?us-ascii?Q?VZQ9j5VECROetsIEZn8UjOw7wpzrUPGWq7PAQnzXmY+PjhxiRFJrgiRm6O8o?=
 =?us-ascii?Q?VstHxizYSDeD8kmyQOeg9kZwNyWZGjGaKl9p+eIwn42+yZw1ok0QeVHbVP16?=
 =?us-ascii?Q?RlJrzQmtnDhNU4vfZ7Su6KtDcAoVRMgHRakxuTy5V82BCCgerSy2tELJOuZ3?=
 =?us-ascii?Q?WzianP9VgJwc1CyEWTCVixFoOp57Z06cTj1nDQW45ZAoQY0fM/k8jhvbxzRX?=
 =?us-ascii?Q?h4xncUD6xDJEMWF6ezVy/kevuo96ffhzh/k6L/PtW2URx3zFO098Wc6u9268?=
 =?us-ascii?Q?Kn9LSTx51TcTBE0J96l9xjQ7gQGR8zSoNVE1QxEjxCRPdW0/R5r7Yozvj9yn?=
 =?us-ascii?Q?dF/83TgZHF/FDi1fIFk2S+cqyjfZKHR3b6IUMV6GvxVkYb/IVl/1ma17Sjy7?=
 =?us-ascii?Q?FfuOgDAmyqrJtWKqXQNrKmQix5/l2OmNFXltfl7azCAG5gnMdYB0gEKtk2aK?=
 =?us-ascii?Q?mTVKdKYUz4h7kb/L52PAvYGJvhcR4qmkV1GEskhDMrsWcVCK3XxwsrBEYYJj?=
 =?us-ascii?Q?zeyEg6w5KZFNEX4sDB7PuLdQIrdT6M2/cfgAbPNWGFAZPtgPJCiUqoGyd1w9?=
 =?us-ascii?Q?Mt+8VEO+cx7d31fnaSjZDL35v04+utd3Ryb9Dgm6tgGxqas5gNxGQx52O+77?=
 =?us-ascii?Q?opxAsaPUOzNm0r5X8u+sZupLIBfyWqcQAjnl4RB+HJD3ONOCypvBQkYJTPes?=
 =?us-ascii?Q?DHKKIOwEEwpxFepghsoDlLxVz7xn+nvV/fZJ3IzLVP5ludVZE0IiWzOFzxM6?=
 =?us-ascii?Q?5Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5i3mI57kYhCeC09FuXxANxp1UYL3HuROuh0cG9fVyU0li91AATLPeI99prftp5I30HNhqvYtDP4qjo+xViAeHgIQDAqIqvYCpMXEPfeVq1sABR8mhZDaef0Lt09IA1CU4VdHe+9vpE4J/jt0VNmybCLqdGKAfzNPjNyW9TjV6XHlmf2EqOgNvvF0OMO0vaRFdHChxW+d5ZX6htIpXWDaRxupF0sUEw+/MITd2kbjSNZJ6xjnIBPsawy8/9h3ux0UdJGXyR3/8HPCTQXc9TAxBuAS1be11wdbhfHwJG8EOlHzL/MKWl15/dijIuEoti2UUzoAfL5nRaeeiGqvHIoSpxYsRtP0gqnfHvDX+UoXYXN5cLmtuQxM38fKlpYWY70ctUWX96p54im4QKcWWReilNZYTjQ0E5il0XVaOZsUMfXr2oFqtmR4zwx4Cd/B1xa2tCNW7ML9hFJ6JswzMnF4SpHcDq+Y8G3DLKe/NlQBII4T2Ncfj18uIbbjeDTwlYhCyQH48hJFAszdzYB3V88XvqiiqRTIp4lWnsY9PDOOAeJ8e2TZ5QKEFmrS2hppooq4QTwyr/kePU13gu37fH8SjEVvbDMFGf7bLA9ht1qDz2E=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 077e540b-2731-431c-9bb0-08dd367a849c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 22:09:59.6873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rGzVprljTpA9FY7QXde+HEVkArMN0LZNTiK5A6Oc574mo27dHQ+b/3LiNxIK0X1elWftyfyVK5rDSy7yA0I5KqiAjAx4aNrpENmFpSe291s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7162
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_09,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 adultscore=0
 spamscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501160163
X-Proofpoint-ORIG-GUID: No8boP97rjNf_s_21e6inaoTmgeufrZD
X-Proofpoint-GUID: No8boP97rjNf_s_21e6inaoTmgeufrZD

On Thu, Jan 16, 2025 at 09:33:32PM +0000, Nick Alcock wrote:
> This is incompatible with dof_parser_t's use of trailing strings of
> variable length, and buys us nothing anyway since we're running in a
> seccomped parser child and any buffer overruns are harmless and cannot
> result in anything other than a dying child.  We were already -U'ing
> FORTIFY_SOURCE in libcommon_CPPFLAGS, but that precedes CFLAGS on the
> command line, so if the build system passes -D_FORTIFY_SOURCE there, it
> still takes effect.
> 
> Use _NOCFLAGS and _NOCPPFLAGS to explicitly disable every level of
> fortification that currently exists.
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libcommon/Build | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/libcommon/Build b/libcommon/Build
> index fd54dc044f9af..00c0d46d125e4 100644
> --- a/libcommon/Build
> +++ b/libcommon/Build
> @@ -10,4 +10,6 @@ libcommon_TARGET = libcommon
>  libcommon_DIR := $(current-dir)
>  libcommon_CPPFLAGS := -Ilibcommon -Ilibproc -U_FORTIFY_SOURCE
>  libcommon_SOURCES = dof_parser.c dof_parser_host.c dt_list.c
> +libcommon_NOCFLAGS := -D_FORTIFY_SOURCE -D_FORTIFY_SOURCE=1 -D_FORTIFY_SOURCE=2 -D_FORTIFY_SOURCE=3
> +libcommon_NOCPPFLAGS := -D_FORTIFY_SOURCE -D_FORTIFY_SOURCE=1 -D_FORTIFY_SOURCE=2 -D_FORTIFY_SOURCE=3
>  libcommon_LIBSOURCES = libcommon
> -- 
> 2.47.1.279.g84c5f4e78e
> 
