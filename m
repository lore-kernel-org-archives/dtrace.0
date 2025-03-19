Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A4518C322
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 18:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742410468; cv=fail; b=i6te7G+PDi602LRoEgmiuuu/RLvGff1Ydx/Q/oDMyRf+qLGDOpTvqhwUUaOzUc22Rs1VIKogN4RIgqqh7xoRMoMsTjYRTnsHn9erQjmpenScjF/tzkb0iRi2oghiFMGlxoxesxAQadiDJR9ses0BcJkeoN29JcTEQvAmAxajpSk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742410468; c=relaxed/simple;
	bh=pCgg+yu3sssRA3XsTQLYl+4pVpbF4A1SsjuSN/PQXmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CARH4bUKxWO1iIuWput8FblFB4Z8KHgJ5DoacFreesDA5UZCwHBRjKZ1f9yN8fyrz9q9S+3FmvG22DyXDkOoJMQadrGThagD0+ur5cuW5phdJQXdXFBxi/5l7xNP9Mg42V4ufGy/auUFklyQ++iukoqztmEjW2J4FUkthmC0VM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KLQWXKbi; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XvkQEfg/; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KLQWXKbi";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XvkQEfg/"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52JH0v0o004114
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 18:54:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=0bKRBED3JxgVEzelS4
	FserxOn75ZWNVhLHUL8mT8r1o=; b=KLQWXKbiSmqDSWEJc/Tbi5+ICHkjzyYv/B
	mjPGYSs35cb+loHyic+6ftQXwG+ThUITQWVBqjjUNhJCuiD5OX7RLqhaeXr10Cpw
	j4NWHPqIGofcNu73fFpsxEW50eoJS5XBs1915TQf5yVacsqyq87LnDeNE98W04Lt
	PzJb+ixDtRYFRq6WyNvHhNNdcf2s4UjDVC3Y1MBt/g8mtBDadDTK0LDdj1Ks+np5
	PpeRt4t6ZnrOzXWWQhNCnUzaa20WTd18zTEib33ld/SR/v3Pr2Lzya232NbxX6SS
	IECi/B40mVgSWfXh2BWD22k3UlTQIBT72XD3/G9WOCpPw2r4sqWQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45d1m13y7q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 18:54:25 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52JHGAM2023547
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 18:54:25 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45dxeh9ncm-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 18:54:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IU2dAAqEP/o0WEztbnRrlcJ29yT9/61oU3BEuacWvvJoAu0+WF+zML81wjJfuOPZZGtjWr9EytdWzYWC3jqEBzYs+22GERZM1hF0lRAc26hN/BdOBLhDDFUTdUn6pxwipw6hELQPdX0znwLe17L3640FwLzoHunLxUc3qBBEsyn594aTuorzglVZiykYHruk3XkICkvO1olnqGy+WLFyGPiLzlOEDfE7eoQYDsi+Qk9QMuGT3jfFMcq1sFAObFZICfoZUADRmKqGNykXBur8Gc8HmSTSyCdCHyLP2K0bpT5DPmWUGtgI25UvvOKrEjdQyKPgfGVD6r9leefnPUeVhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0bKRBED3JxgVEzelS4FserxOn75ZWNVhLHUL8mT8r1o=;
 b=ur7M7PvKEKSyHOKL9HtJ2CH+2XRqUCcOu620yJf4j6rUEQ9ds0zsSnXYwpLHoaJ0YgAQ6l4jh2AAN8LyOX1mxesG/MrKfIqdVrN+V0QsawT62Tr57p//Dwrs8WNy+r2iUsvvRTvDHZK6mmgLOFNBQKCOW3r+EJRFzraHZArtQBiXnONp8xcuGr6wYSpG4WLVXNB32k7SKQeDV7xNti9i5xP1USzOs8P6pxqT1jIKDc1em1jCwuga5xu0DoFNxSpW0X3lJ1uo2QItmhzjEg6C16cu0r90EEleKcbd/keKICEHJmPB/4LIAGPeeJcD1l600lcWBlYHMijWoTzXG8858w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0bKRBED3JxgVEzelS4FserxOn75ZWNVhLHUL8mT8r1o=;
 b=XvkQEfg/LjfVHdXkX+TXLNhpIGR/RgwMumBqgCCq8Z4yrSEYmWgdx8GQDUu+bs5E+87C+l30I/0ZfD4JcylU719l6SKMrakkdEF8caEpK/tf45qmwGoO+rfLBZyiyDGQxJzOfSjJjIc489SzFcMKBngBhcT7Hf1kc8J8+yjK0g4=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by CY5PR10MB5985.namprd10.prod.outlook.com (2603:10b6:930:2b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Wed, 19 Mar
 2025 18:54:21 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%4]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 18:54:21 +0000
Date: Wed, 19 Mar 2025 14:54:18 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] Fix dt_bvar_probedesc() for late USDT processes
Message-ID: <Z9sS2sZiOozfT8Es@oracle.com>
References: <20250319063230.28171-1-eugene.loh@oracle.com>
 <20250319063230.28171-2-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319063230.28171-2-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:208:36e::14) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|CY5PR10MB5985:EE_
X-MS-Office365-Filtering-Correlation-Id: c3b9f43c-a16b-4c32-df6c-08dd671775a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?guPUy5BV4wtx3dJ+YqvYoAURhFcWq8n/DQsKKWNGv2kTX2RLM9KouLcH6tjO?=
 =?us-ascii?Q?BtVe7Z151Jr6N1yX1ZRpi1/LibTVS3qUvELgIzl9pZ0pT3F16lCkB4+kCC6x?=
 =?us-ascii?Q?naVvjumn74nymwloXnYesppsvNQOive6ZA+j0Fk1CcFqc9ZEyfl9BYUzLvm9?=
 =?us-ascii?Q?tPFkRdDe9Q4fzL4Dotvvbe7tsmkQpCqo/n49vUSidDOp1JHsPmuTLG7mQIHK?=
 =?us-ascii?Q?LI4uosLRhSQtMy2sjwyQSXYNq4UF3io1Erl0E5Gme/ch3nBpg6RENTayuJIA?=
 =?us-ascii?Q?p+jISVpKXl4RLssqw5xR/miZLRrQnu613z6/Pxw/TM6z8COlTurkGtxwM5nn?=
 =?us-ascii?Q?7ARqPA2kjX1j/LHnxBcrHLGsJayRSoBmoSPtQc1jRo1f0EU4D8pJ66oWk8t/?=
 =?us-ascii?Q?+NaS31DNx9BYbec9mL0pIYjEAzWaxOLvtgPNHB+421jMdZKAbf+iN+1la+oL?=
 =?us-ascii?Q?U35V5JnWOonRwHtgiTGnJn9BCHHcmEg4oCb5DLj8MaTuP107xgtpxdrLQpTz?=
 =?us-ascii?Q?PdTDlgfw7QnIIbzr5g5TXD52Q28G58bHiqm39YXZhIw4cAAcYSgkltvddgNc?=
 =?us-ascii?Q?341f2PRdT/ePO1qATPPvqTz41sDciEiZSQDLmpHTVnzKeVoEHwYEPf/rmD0g?=
 =?us-ascii?Q?JHoKpzLxRqpVHipK3uCEG5KrHT2Z/1VF4fnIVO3k0Qm1xPAP03sdtKwsqOat?=
 =?us-ascii?Q?y5rr84WqK9mdiEOxUXJC9UESvnLhVyI1rPF8S7W3Alvh7lo9LGfiTZaifriW?=
 =?us-ascii?Q?0h+f9+ZbxVDLaSWPVNlK90Jcx689qDF/uhdgwUrGhgz+zeljH4OMwevgv/fF?=
 =?us-ascii?Q?D8VZmdb/Fiou/4ifO1Y0rTkN7/ingtZSOBOPZTi8S+rQ3DKUTw98rna34LEU?=
 =?us-ascii?Q?4GOK2pbdS3RJw7ZyZZriKQZtq7FeOig/HMcnij+XKJ64OGzTXIc5laPIpNID?=
 =?us-ascii?Q?TtmVolA52OEbiTUHdRVz7nr1Xhmx5AqYGcXrAXG7iPq94+6K+3HdULM6aQHD?=
 =?us-ascii?Q?rbR4tfcoqY0IE1ZCVe6iOqA+veaA1ITiw8gUrmvMJUqlqNDZZtQtWA33hPMS?=
 =?us-ascii?Q?Ke17segZ+3nv+RuSK8e5pN5jNoD6OR12udDfZgj/VPvP2uL4jLUuwP2mPsT7?=
 =?us-ascii?Q?o8s/DI0fbhRNvOljhT+FnsJ1rSoxL7LfnpsDo44oCdV+j+Qjda5V84J8XPL3?=
 =?us-ascii?Q?TJslxFN4VvXD7wGmls52mxP/uGhJvPT9r/sLgOLq09/BqdxGrVgrVsNyaSqe?=
 =?us-ascii?Q?6sjZuk4uIMl/3TrpzCnsIhUFaT9zOrZZTTndIB8jNm6S8w7Cp50g0R71q/hZ?=
 =?us-ascii?Q?yXCO9JURCha9m8RPU8c76B9NpGoOPP05dqk8Lu4bk20LVUnGJVMd4D8eg0hy?=
 =?us-ascii?Q?eenmaDbE07t5bm9ny4iDF3htbh9f?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5vvjMne0Qr/acaUqg3tlrKD+TDBuTYu8inc81+qqW+i28lWX8OibjAMfveUR?=
 =?us-ascii?Q?wdAtuSV4Ud00rNyXvRQO9P6ZkUs63Z34UDkEAM1bbFxVXiyBi2G9sRKCqYph?=
 =?us-ascii?Q?V0piIHdJcK3AWaRFlyT/M65GniNXWaTeqLdJxDNB02TbNPZrUV53C/GyR51b?=
 =?us-ascii?Q?f/c+W8bdPzMwVWnxNs2u+pUsG5K0Lsi4qrh9ivlCVC5WiW+Frr0Ew0wp9DhC?=
 =?us-ascii?Q?ekkl518RYdSpppG/xJvGGGKAOnxmozg/y4Z9M+Yo9ZfgHW+Fb+dBELdCKFQY?=
 =?us-ascii?Q?2/OxrQplYetTVZzyMMLWkCnFiZ+yiDWFshxi/wrsBqkQQ17KSzM4ziz2X053?=
 =?us-ascii?Q?xV9br610AhGhAgTgMEVNMSo/zTmgIKQopSXWhBYlgCCz7P3ZYYDP29wCKwvo?=
 =?us-ascii?Q?vOxHw64RECJvrZ20EcTyJJUs40l5ZfQfYm76TqvGBxLNHFFxHNlf1gbfV19z?=
 =?us-ascii?Q?V74DdnUFVo+TDBFdx9/O4lgwV2qDFODhPhiucWsQOHUh4tkKKDC3w15RvUqZ?=
 =?us-ascii?Q?j4WJQ8BvurCBFFABHc4grYPtSnTCYtElWbHZ8MAjIdLrAVGOmOuZfd0lpadu?=
 =?us-ascii?Q?dRsi2bCHjxzGy6UB9W8MKrGo5dtvjFBMFAdd8erNwSOx/83qqGFrZoMqX1Yj?=
 =?us-ascii?Q?74cXRsqhaBAQIehGsxycctSUsZOiZziJ66sMsqBxZswZs/+K/IvJj/RCej5I?=
 =?us-ascii?Q?UCNuuhZP+2VZUbcUemilpeHhmPFuWri4t4nHUcIbe/o0KOTHqYPKwDKOI6xF?=
 =?us-ascii?Q?kfB5RZUx9xRYNAYneu4o9lDn5FLoLt37DwqpYauDTNcu6tabY2fAAKPICzBh?=
 =?us-ascii?Q?86mjjA3laIMDhBwUUMAxXeIJtGtN7bQ0neRhGspimbenmd2A5eGjCyb0w3NC?=
 =?us-ascii?Q?RaW5RIxfFyhiPDo29KrRJoSHk/tJF7sgX27ac4rR/jNzng+cAWUNZFlxC7Yw?=
 =?us-ascii?Q?ZKfFD4BvfxGQ6WlFes+55pBYkXtdriaH63UrpdT8/DyQcnT09SB71D4Hq5N+?=
 =?us-ascii?Q?cp/1oc+XPS84GsBe36zeSZhNcutgusIP3NHfciXk3OeDWOKQMklJvVFo+tGo?=
 =?us-ascii?Q?sC/a+L02jHIvCasIQKS0wF7jV3hsiyftfUTorBeiAah+XwHu++wtHL8C/gPX?=
 =?us-ascii?Q?7DLwgQfTXpMW2n8jRYiVyD68np1IMylcZSO3IVgJG0naMMM2SxrWRAHM+8g0?=
 =?us-ascii?Q?zKPClGgyrjcD6ik461BvyWR3sa1XfHRRPi4q4pH9QMcNx4DzeXP7sfJEMcHf?=
 =?us-ascii?Q?H0/XMdRKWbT33wl+LHtAIU6WmkJOgTc04oYMtgZaLQi+li7xXxPKkBZnXa3O?=
 =?us-ascii?Q?0tTNUsBT0BM+9x7tmHYviDVP4AZw/auW4ZGKxSidGmso1kYuQVNAuGUeSh2x?=
 =?us-ascii?Q?k2v5QwHcb8VWytKWrRjJQv2zDNF4myvlzWUnde1vEezn61DI0+uX+diG7/WM?=
 =?us-ascii?Q?DMfi5TjiS/u4vOSFQf3cNV0owfmKdvmOdGCevTCu1YsTrxHhkdhYW44vtejz?=
 =?us-ascii?Q?6VvkD1rhY+KTidYVFWtXaWpZTSVHG/L+HWkOmrxQGnvinL4fcXwk3lNmM5vY?=
 =?us-ascii?Q?/i7NISAz39hELTzo6zSFc1BcfsHroSy56Vnr8al/D1fti8H0hZYLoXq+PRGb?=
 =?us-ascii?Q?ZA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uAgM8RIH7L33rbqMGOlr3/Mcz6oswf24Mny78cNsFQwwWWyFCw8Vv/SGV2DUWyUu5oKQ2eLg9oRIQSrwlExvgPi7U/Eg7QvDNFjT1RRI9taXiXMKNDOzqdnEG1IPOqZIHJqyrq39gusVtA8cNoPvs6qRxCkDs5dGC/jNmAQ0MvsvNO7FYC3LtOA349GCL/crvR6DMzXrIbvCAhOf7fgguUKbBSS8dBBZYT8FspFQJDi/8foXplfPQVpe4YGtDSLNjHFFTtHibw0gdaowmsyH9HP3WV886SiMTv7xFZPLon2Vpz42BoglF79/D1vyHlXkFuPTZy9+5WA24eI2aRiF6GnJe7L8XSTGTfyKarzDNXucOIqUNnfaKAx8n07xl1qS5n6Xa2w5B3mC6rZhbxYfhJsqxalOjAI4szoDGhThs1ufdtViCTAxst6tKmfKihOb/WaNh59Hi2uKlZKUBSDaZgNiCcYUwQ4JDazovWwx32sTU/XEBMkVshHePcbCmM0US2Adi3QVrWTdGlLAX9elijPpNo9ntgfroHXZe4xHhN/x6MVk15gY/RGN1eB0C69v5Cz2bbojuiT5QQeQ0oMmoRPQ1FFp6+1SdJy5odCDrl4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3b9f43c-a16b-4c32-df6c-08dd671775a6
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 18:54:21.4467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oOq1EXUjh4s47/qAWG92utc8zqxK98zNGelwIJNMlod2XNMRlN1bjHMRSdIHi3dXEYlHqt6BGzUKIxAq9TGuEyu9DToeJQkc0N+hcyRRMMU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB5985
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_06,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503190126
X-Proofpoint-GUID: 8IA2MG1suzzKhyEgAOp0S4LmZ7HFmoZi
X-Proofpoint-ORIG-GUID: 8IA2MG1suzzKhyEgAOp0S4LmZ7HFmoZi

On Wed, Mar 19, 2025 at 02:32:27AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> With commit 8bd26415b
> ("bpf: separate bvar implementation into separate functions"),
> test/unittest/usdt/tst.nusdtprobes.sh started failing reproducibly
> on all platforms.
> 
> In that patch, the get_bvar() function is factored into separate
> functions.  It includes a change that looks basically like this:
> 
>     uint32_t    key = mst->prid;
> 
>     if (key < ((uint64_t)&NPROBES)) {
>         [...]
>     } else {
>         char *s = bpf_map_lookup_elem(&usdt_names, &key);
>         switch (idx) {
>   -     case DIF_VAR_PROBENAME: s += DTRACE_FUNCNAMELEN;
>   +     case DIF_VAR_PROBEPROV: s += DTRACE_FUNCNAMELEN;
>   -     case DIF_VAR_PROBEFUNC: s += DTRACE_MODNAMELEN;
>   +     case DIF_VAR_PROBEMOD : s += DTRACE_MODNAMELEN;
>   -     case DIF_VAR_PROBEMOD : s += DTRACE_PROVNAMELEN;
>   +     case DIF_VAR_PROBEFUNC: s += DTRACE_PROVNAMELEN;
>   -     case DIF_VAR_PROBEPROV:
>   +     case DIF_VAR_PROBENAME:
>         }
>         return (uint64_t)s;
>     }
> 
> That is, for the case of key>=NPROBES (that is, for USDT probes that
> were added after the dtrace session was started), the meanings of
> prov, mod, func, and name were exchanged.
> 
> Restore the correct meanings.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

My fault.  Thanks for the fix.
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  bpf/get_bvar.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/bpf/get_bvar.c b/bpf/get_bvar.c
> index c760126da..fadb06c00 100644
> --- a/bpf/get_bvar.c
> +++ b/bpf/get_bvar.c
> @@ -185,13 +185,13 @@ noinline uint64_t dt_bvar_probedesc(const dt_dctx_t *dctx, uint32_t idx)
>  			return (uint64_t)dctx->strtab;
>  
>  		switch (idx) {
> -		case DIF_VAR_PROBEPROV:
> +		case DIF_VAR_PROBENAME:
>  			s += DTRACE_FUNCNAMELEN;
> -		case DIF_VAR_PROBEMOD:
> -			s += DTRACE_MODNAMELEN;
>  		case DIF_VAR_PROBEFUNC:
> +			s += DTRACE_MODNAMELEN;
> +		case DIF_VAR_PROBEMOD:
>  			s += DTRACE_PROVNAMELEN;
> -		case DIF_VAR_PROBENAME:
> +		case DIF_VAR_PROBEPROV:
>  		}
>  
>  		return (uint64_t)s;
> -- 
> 2.43.5
> 
