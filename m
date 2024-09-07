Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B29A1870
	for <dtrace@lists.linux.dev>; Sat,  7 Sep 2024 00:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725668466; cv=fail; b=Tc+O6w8EptnMqEZMRtrOmFqFJRcI6ieCbtfPn2xA9d721boySDitee8e//5Fq4SguOk+sUswyArNVgOZzZPgTQnGWLord3XeOiKtptsfsQsTtjcdVUq+mvgSAlv6uRHNwYgM+d1O5A4mIZNE6uXKzDN/mZWSNMbNzIk724sIr0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725668466; c=relaxed/simple;
	bh=+fz9UwDkMl/uDQ3qaa+S9JNjpxzcrOP/O0XLxhf6BsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aL0kNYGAZOstBJmKzq9KATxscY+VBDiQcjX/v5tpESuNF0Oh0cFOBjiKNU0L07Xt+JQ0qXbsd3ACP9LBGgjbhc/LvulmcEuL1FpP9fWzKTmMtpaYmh9Qm60UVH1ZfuFXTE/xQCYmtTpQ4hrRQMQw1dXQTiEgbrr8J3t5ESl0V5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TxXdwBiJ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=O1oR4c08; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TxXdwBiJ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="O1oR4c08"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 486KXU6n032131
	for <dtrace@lists.linux.dev>; Sat, 7 Sep 2024 00:21:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=81hjonkc3tKLnR1
	YfnclpfUuP4XYa24V+GYhJ5G/knk=; b=TxXdwBiJY6ddI9hThRzFiowW7dBjSTZ
	bXfHlr6OOHxj3rPw+lUt/dcvcIVLxd5Z4796v4fUXMAjCCvavolbMRdGU24/2CXf
	LwOdqOJX/6v9sjnb475rg5uN6QOhtQO9f9xs3kaod6GDwNvGsVr+v9aKDV5Cwe91
	aJTu3SwtFtR+gJHaTJbEvmOdytRVfrHRjmu2fIJtsV1SOym6GjQmwtrYoe93YQxQ
	5Foxr8REceqGkJmzXy0FXqRaNZYCB0obHlQrTdA6aNSVHN56WTX/iCv+ZVV9dgtR
	dfWMRdOdpcNayuelj01sgl12jw0vAyIfuTyeEYi/aI8Zh3ZuP9n91hA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41fhwntry5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Sep 2024 00:21:03 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 486M2n0f040929
	for <dtrace@lists.linux.dev>; Sat, 7 Sep 2024 00:21:02 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41fhycjtsp-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Sep 2024 00:21:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eXoMVYp9XWL3cndLHx6aDCy+GZV480gtCN17a0o6IyXlKwta9h7yXd2Zem+bhJ4Qb4bA6GNXedsDq8d/G1Nk/Y5TuvFLggezsLwvtOaJv0CG2NBqLiVF10io69Sb8BfMXRZTgaim79TrLPG1wLY5BbRYqghn15Wqbc9JHt1HNM6jvYj37WZCu2aoZmbnhHYWfq7ajimtK8BNHAvIywoVnj+2mIVEY1AZqdTOmnwZj9dH4feZhEpH9T/QHwcIoA5jXSKHTdaHtx4VM1WsJZ3f3C6KCU57smryIL/isZVJDDqnKlZXzsn78KKtIuocB4ZHai8lfRJLo9P+WPzyWIrA1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=81hjonkc3tKLnR1YfnclpfUuP4XYa24V+GYhJ5G/knk=;
 b=FaZA9XThM4FDIyMUnrvdYZNfM62cra356qXpsUxwiWjpAiR0Zs2mTy5juBeubn/NC/zyvSWmd5N8km5VQsa3QK/CZaqIklp910IA8jb2ZqIh2zbKI5/f6kYNGC752c9riv6nSvx1xw2L66KxtWl9V1YgFpc6+2jUNyAhu2/WTmbsMmQNXggc4KROG5YW+nWMMPB0naAwanWEiJTjBm1xkFOIm0vplTVKpSaiEnq7Cd+QyNLAagTzNygrQbsZP95/HO5HjA4nIvvuaOK6UXctP7H1imR33NY3v9WBVnTtmlNAiAupXYMA4vEhDx+gTiGq2RV7viBElr6s5OCoWm67Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81hjonkc3tKLnR1YfnclpfUuP4XYa24V+GYhJ5G/knk=;
 b=O1oR4c08n7S5fhD/GsYiKPQnNUisu1cK96zFsgMYCTlGqhtsvadTxQIknnQ0wj5knbrnMS+6bvhG0J6uocPnsSQtoMGrs0b57FWdc481iKxGktrPubXXcNiQTKQFijQNBdI96szh0CO9tqAErnJJnRlOEEAg4+Ph1Xilcyoa97U=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by PH0PR10MB5626.namprd10.prod.outlook.com (2603:10b6:510:f9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.16; Sat, 7 Sep
 2024 00:20:57 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7939.010; Sat, 7 Sep 2024
 00:20:57 +0000
Date: Fri, 6 Sep 2024 20:20:54 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 05/22] Set the ERROR PRID in BPF code
Message-ID: <ZtucZiRk7G7UVktd@oracle.com>
References: <20240829052219.3234-1-eugene.loh@oracle.com>
 <20240829052219.3234-5-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829052219.3234-5-eugene.loh@oracle.com>
X-ClientProxiedBy: BL1PR13CA0313.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::18) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|PH0PR10MB5626:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ef28831-a922-4a3b-4205-08dcced2f199
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RV9qA2c+2c8u2VjHOSyIjcapEM+rLFaLtBhF1DIohxu0sVDSbhE0+RUcAmql?=
 =?us-ascii?Q?AG9NylhiJX/zFX8wG7jnUeABI4cAlqVeiaAf9R+vqxgMjcHeCw0/xbSVjjg5?=
 =?us-ascii?Q?WsqQXXYf5sX3aRxDyFFUCOfWx3d2ICwN7Yv1gQyMRznoBCGk+EKIed2MfGJM?=
 =?us-ascii?Q?h9r98LoQ6kKIu5k6UgPvQas6SpzAyaV3T1UrMjV55FLpUWe3rKtsCUvioUMr?=
 =?us-ascii?Q?QJN6L+uI9hHWjYBH2DP9a5hCEolpmsC06uNtQ32m2QmmFr2lsJ+zl01xYdHD?=
 =?us-ascii?Q?NJwmo/CjQOArg8L2M7jjFj5HjVPSAWVX9y4sXXuTlqXRvfTmlPBcBNtD3r4A?=
 =?us-ascii?Q?Vc+5JpPc3r+pT0ku5UaIbfTjzC65bdq+sahIbiKIcmvah8FkBOZJo/Ql1ADc?=
 =?us-ascii?Q?d2nIlfYda6kwUdyCXNBAMfiukShRIJNM+HS5fqXaYSlvu38uCOBu1KVD6bYH?=
 =?us-ascii?Q?TrLtB/+4ra2uVVnNfJGpT5k9grVsxuUKXJb3di0sd1iCc6Bbxi05LFq4UBQ0?=
 =?us-ascii?Q?zBcNu6E2H5FNq2JaOkaKiDgsydONr4g5IQoeXJABbH2eD/bBqULoTYsjCovs?=
 =?us-ascii?Q?+nvHW3wfSe2BqNJR9XARGcXvXcr+BHPCJH4UUhoht6fGG0E0O+rYFTs11dLW?=
 =?us-ascii?Q?vmpzMVBadYrilFagHfo/RhmjkTfbxB5Ab6HaizmEW/e/EjfaV+EAcPDSAP+o?=
 =?us-ascii?Q?pOrxdlE0plz/4tDVJmzsiuWyF6X9MMtBVj7c7w9pS6ndJKvoCsK9Rtyr9DHU?=
 =?us-ascii?Q?yzOFqradbJhDUXomX+ViR+2mR0A5znAIDkoUyxxDhucWelyo0Gb9hpSh0BbA?=
 =?us-ascii?Q?+pRY8KG/S34sXuKDWDiGMcJZtKzuW9NodIlY5SI4iox6CtSL9jq0lmL9t5Hh?=
 =?us-ascii?Q?oq9Cl9pGIevPsdRtMPJ64GAw/E7HVGaJ3XOh/BQ+p4lqK+ns7hiZMOIX7pFd?=
 =?us-ascii?Q?YWPejSV5M0eTkM5NQfe0O/gsSkLHgkRemE1ky0cYTptNOqpl96sFd9F5/hBI?=
 =?us-ascii?Q?reFJpQ39IU6b6cZlJLANGCfF8i7qZJQqRos2Gp+FvXkomQ1K7wgjxd/vb2Ht?=
 =?us-ascii?Q?sY2on7Yada1Tcq1VRJG2LnQCP+6dXJZT1dVxI+MpnjoFqau70SIIPiY2zwgj?=
 =?us-ascii?Q?gzCC5JaHcBLfemiw3gb1FsI5iRFMd4slHSWITYzXxbBVFQN2kiZN4ZxsDSBi?=
 =?us-ascii?Q?3dchtjE9zlbQV126l1KSyIQHLMrylkN+46QwmbgJ12YRPoApd8jJ41JFtnKD?=
 =?us-ascii?Q?OoksNSvXATM6clJ3JluUc7mKp3hFzLxDvXSQynPMu9P8Jj7CZBVIhWaz+Q7I?=
 =?us-ascii?Q?QZuo8o1D0Rn6Gs7895hhpAo1LKErgAllDWgzeYh9TOoRxWHAFv/H3rH9iCL3?=
 =?us-ascii?Q?0H8YlD8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CtYQvpbMO0R6oMzrFD4YNuI4xGa3r1mUmFyWlVk+5zP4X6C1dlQCwJrY+1Zq?=
 =?us-ascii?Q?ACouAgemkkBGrimsA5JNfMRdCr00O34DNG4TTQ868XsspspqokkUM1i0cfJD?=
 =?us-ascii?Q?anIcvWUwyA1uNqBjmaAXhPPnZdUrBKMmg42AiJHGiF6czLC0DrlhNBIp2VVQ?=
 =?us-ascii?Q?+dWVzg6a/ob2qBWFbLufor3Ta13B8OZMQsFvb70o3ca/VzTINXzzJzbfJtjl?=
 =?us-ascii?Q?22y6fS9kUNqp0CrUllTle3NI5CIBuX5Vc1cjjbWQXGTpbIZARgunQ2NJzAmT?=
 =?us-ascii?Q?k3wSuCTUS+lMTzQYZOAZF0Vuu9d5HMpLRkP23casfk0tlGB7lxZ1AUyBi0d5?=
 =?us-ascii?Q?rcIRQ/qnqWwQMRzI4QMmUtIgOgc8hW9pOrGjeqiK8eMWItmXU+9NT4l4X8qF?=
 =?us-ascii?Q?gPHz/0B5v6h1eaGu3pOobKO6lMIy3/QVtgZ0lxL586m1xQSOuzlalzMM/5z6?=
 =?us-ascii?Q?6VORrFBLPLNWCZXc93TFmCqJ7UbpYTRzYzdqUmcAlrjJTM8k8LeX0X0+GAum?=
 =?us-ascii?Q?ZNfHO5cQDK9a7zJrPMNuKeW+v2E5JJYbg02iZXozSZDxlGdTB9RlbyUjdhpG?=
 =?us-ascii?Q?nc8rY/d8xTcMp23/S93XPMpiiksmhO/NasOJhP8X0k+Puvz2n7W6IAs8s/5L?=
 =?us-ascii?Q?P6f8Nlq1wBXtU3TAKhqWzRPqUv2KkORFEFt57Mm7JKqxYMNgo78ci84j8b3F?=
 =?us-ascii?Q?/xUM73MZhlb2R+31SCHSnnlHAdWLpJtUCJFBoBSf6/Ku4rGXTiz6GC09eOqq?=
 =?us-ascii?Q?m4nDzBHrUN3vqgs+4zLlzL0xekXiw0N9OrCx82drOkx3en8TJZbnCgATFLvv?=
 =?us-ascii?Q?mMHWizI9qlml49+zcoxyyGLCcxrEPA7ZFNoslqSxqxi7WgYcwyzfkKSos3TG?=
 =?us-ascii?Q?Sh0Si7hDwL6P+U4aQANqOI72+g50M9/Ud/Vu75v/+/2YVVwJSX+eKoFdAc1P?=
 =?us-ascii?Q?NXBeyygVZy5Ym7Y6aW3C/jYstY0s9sy9O3n8zZN04lu6h8GYAkHGfXQp6cDu?=
 =?us-ascii?Q?+qvDtptWb7XsYIj0L8ttQbPO2mdlpUFkf0nVGiTd8E3PvcKljEcFeYkvzhOf?=
 =?us-ascii?Q?cSgl0LDmXVLiVPH4wX7k0oro0dr5LqZegZvJZaHbQba/14FK1yd6MyEF+o3F?=
 =?us-ascii?Q?xxr27CR1s9P9hUoLMaj1UbbO5M5oZ/KZCsEoZl/7OqhZuOH0IHM3eeflBgUp?=
 =?us-ascii?Q?G4s6jtqfnGuyunWGx88Gr8IsiSZrSrjGYyOgzUYXKLn/2zNGPqGmXrdE0sP/?=
 =?us-ascii?Q?/ko4XIw1nUELQm3Ljvw6K/y1Nw9YPPHzeN8GMF5Jk+NpKgUZXVQ+vZxhTt71?=
 =?us-ascii?Q?kirQmIgFBBX9u85I2+GOBPzzP6cJ/IgEgOtqwPcMMip39MruKXKORLu0WVmH?=
 =?us-ascii?Q?NS9D6fn84UB1zP9On0TZ8F1a8uq8b7NYKtfJEw2TT9Gqet3V7eBaS2AZxZ/5?=
 =?us-ascii?Q?kKKhHl0xzL0zFPkrB19vC9qwa1rItGyuncVlvM8IW5AMBEQBs4kyQyrjJghK?=
 =?us-ascii?Q?vye63fH5QsiOQYwgC/RY/q6NA1oP6520gYX2+7MY/7Z4aHMvLd/V6NJq93Em?=
 =?us-ascii?Q?oSDfcyHhIs30fA/7ilquH1aTRG02JlysUn+pqM4m3jJPpMCKLf1iF6ezIdva?=
 =?us-ascii?Q?Bw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YMBwUlgK3haV7fXdZXMvz9CszaAlnbFw8iNJy1PCP8fhObbv2SoUwUOVA/g7hNZ+9lycz2GA4RLN5cuiGyhTYuH2/EaG+rmWvKLaLCZcitbpAuFvdW6lEbhGceymvTsVxwXvb0MCCMDT+LDl1bcA37nu1RXlACXBjWtyeDQPTebglMu03dSiOMw20bcM4GDqVMaU5iqNX7v/OEmHoIoxN7O4ai/NE41q2FpBhZ0UojXMuwK0ayu9N3yBw5pcPDxSQmE51iWpyYHQo4bB3AeXo041IlbfELcYv+NJqf7n0X5J/o5R4w74BUD8xL2LFCX9NZxHe5vareN34PMc7+aA/J3VkrUmBmkyF2ExZ0aG4N4+qKHmJc4JwXq+m1gFH8rXOJ4N05U2q8GUXy2yoZ9VXcZ7q1ulBM03wGdnM22Hh91TBH5FQ2Z0252ulpag0nnBDCg4ZPVdew2VHZzd9INXtOPgQsrUjlHTgCxtA3oIsk4/lVTrpezeRpC+I6gyvuUa9+K/v6SSDEgOgMiP6Z8kAI0ER5lNJN6byDlSWiCUMKvTMaIx34AmQdstukgn29yolSOPhR11P2CXB0MZKkgAxDOjcvdGhBXuuuUl3kThP4Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ef28831-a922-4a3b-4205-08dcced2f199
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2024 00:20:57.3076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xq+SFnPFdgbtIUmA0nHOEtD0TlbZSJaLAdCBMmdLEeOLh1FpLvogCJOB2tokEIYSpjyDr6ZKPcdnH2nqQDO2QbctK1wg5UZiE8FjT1Qg+Mk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5626
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 suspectscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409070001
X-Proofpoint-GUID: RfFN3tUs7dCVUNchi16TlJulwbrELbr3
X-Proofpoint-ORIG-GUID: RfFN3tUs7dCVUNchi16TlJulwbrELbr3

On Thu, Aug 29, 2024 at 01:22:02AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> We use the fact that the ERROR PRID is always 3.

Where do we use it?  We certainly should never override the probe id that is
assigned by dtrace when providers provide probes.  Will it always be 3?  Almost
certainly, yes.  But the right way to do this is to actually make the ERROR
PRID available as a symbol that can be resolved at program load time, so that
the dt_probe_error function can get to its value.

Anyway, the need to restore the mst->prid value in this patch also highlights
that there is a much bigger problem...  A fault in one clause contaminates the
first 6 arguments of the probe, and since a fault only interrupts the execution
of the current clause, following clauses will no longer see the correct values
of the first 6 arguments but rather the ones that dt_probe_error() stored in
mst->argv[0 .. 5].  That is a bug for sure!

Here is a test that demonstrates this issue:

#pragma D option quiet

syscall::write*:entry
{
	self->arg0 = arg0;
	self->arg1 = arg1;
	self->arg2 = arg2;
	self->arg3 = arg3;
	self->arg4 = arg4;
	self->arg5 = arg5;

	printf("%d / %d / %d / %d / %d / %d\n",
	       arg0, arg1, arg2, arg3, arg4, arg5);
}

syscall::write*:entry
{
	trace(*(int *)0);
}

syscall::write*:entry,
ERROR {
	printf("%d / %d / %d / %d / %d / %d\n",
	       arg0, arg1, arg2, arg3, arg4, arg5);
}

syscall::write*:entry
{
	exit(self->arg0 != arg0 || self->arg1 != arg1 || self->arg2 != arg2 ||
	     self->arg3 != arg3 || self->arg4 != arg4 || self->arg5 != arg5
		? 1 : 0);
}

So, we need the ERROR prid value exposed as an external symbol so that it can
be used in dt_probe_error(), and a patch that fixes the contamination of the
arg values.

> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  bpf/probe_error.c                         |  3 +++
>  test/unittest/builtinvar/tst.id_ERROR.d   | 32 +++++++++++++++++++++++
>  test/unittest/builtinvar/tst.id_ERROR.r   |  3 +++
>  test/unittest/builtinvar/tst.id_ERROR.r.p |  4 +++
>  4 files changed, 42 insertions(+)
>  create mode 100644 test/unittest/builtinvar/tst.id_ERROR.d
>  create mode 100644 test/unittest/builtinvar/tst.id_ERROR.r
>  create mode 100755 test/unittest/builtinvar/tst.id_ERROR.r.p
> 
> diff --git a/bpf/probe_error.c b/bpf/probe_error.c
> index c8ddcdfa..ee1a1793 100644
> --- a/bpf/probe_error.c
> +++ b/bpf/probe_error.c
> @@ -26,6 +26,7 @@ noinline void dt_probe_error(const dt_dctx_t *dctx, uint64_t pc, uint64_t fault,
>  			     uint64_t illval)
>  {
>  	dt_mstate_t	*mst = dctx->mst;
> +	int		oldprid = mst->prid;
>  
>  	mst->argv[0] = 0;
>  	mst->argv[1] = mst->epid;
> @@ -34,7 +35,9 @@ noinline void dt_probe_error(const dt_dctx_t *dctx, uint64_t pc, uint64_t fault,
>  	mst->argv[4] = fault;
>  	mst->argv[5] = illval;
>  
> +	mst->prid = 3;
>  	dt_error(dctx);
> +	mst->prid = oldprid;
>  
>  	mst->fault = fault;
>  }
> diff --git a/test/unittest/builtinvar/tst.id_ERROR.d b/test/unittest/builtinvar/tst.id_ERROR.d
> new file mode 100644
> index 00000000..59021c60
> --- /dev/null
> +++ b/test/unittest/builtinvar/tst.id_ERROR.d
> @@ -0,0 +1,32 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION:
> + * The id in the ERROR probe is 3.
> + *
> + * SECTION: Variables/Built-in Variables
> + */
> +
> +#pragma D option quiet
> +
> +tick-1s
> +{
> +	/* trigger the ERROR probe */
> +	trace(*((int*)0));
> +}
> +
> +tick-2s
> +{
> +	exit(1);
> +}
> +
> +ERROR
> +{
> +	printf("id of the ERROR probe = %d\n", id);
> +	exit(0);
> +}
> diff --git a/test/unittest/builtinvar/tst.id_ERROR.r b/test/unittest/builtinvar/tst.id_ERROR.r
> new file mode 100644
> index 00000000..95974abe
> --- /dev/null
> +++ b/test/unittest/builtinvar/tst.id_ERROR.r
> @@ -0,0 +1,3 @@
> +id of the ERROR probe = 3
> +
> +-- @@stderr --
> diff --git a/test/unittest/builtinvar/tst.id_ERROR.r.p b/test/unittest/builtinvar/tst.id_ERROR.r.p
> new file mode 100755
> index 00000000..884b43f4
> --- /dev/null
> +++ b/test/unittest/builtinvar/tst.id_ERROR.r.p
> @@ -0,0 +1,4 @@
> +#!/usr/bin/gawk -f
> +
> +# Drop the line with run-dependent PRID for profile probe.
> +!/error on enabled probe ID/ { print }
> -- 
> 2.43.5
> 
