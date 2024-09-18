Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3641C9DFF
	for <dtrace@lists.linux.dev>; Wed, 18 Sep 2024 20:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726691640; cv=fail; b=eVDrWepsvwyL6xTH0hrqjhebEo2fIojcdnz2ZYWPpzTZpgvzPbz/9EQmyJSqqQMmA/93cwxD+4yduwEW8AQuYbxQwqE7XepvHJ4lg16HCBrEeGyk7Z5sbZ6aa73NJS2gkO/pt+hgZdEJE7GgAu4PCnyok5MDI9jkKC+24DtpJPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726691640; c=relaxed/simple;
	bh=TxRNYdB4qv8htAHqY0a+oHg/QmhbM7jVRizSDotkqwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pZebNl32WaUnk+P2TBtJxFddOBc/vwbiueJ6l5CU9eUC4cjCQkG8pQ2FpeWo7cemIlYb5H0Y5xCcipLXWb8RV8nKZdxre0g7ZNJQPLavl5xBbCoLssY0wVoGjH9KiGfNgpvMUU89xJbLG/NLhOx+4tgRltrhYih7Wy0cgGr5wxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QniEopKl; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=q2H2wYm3; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QniEopKl";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="q2H2wYm3"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48IJmn64008471
	for <dtrace@lists.linux.dev>; Wed, 18 Sep 2024 20:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=LwIspBIcDDmEgIP
	WXnjt5MTujS3KMLqEr7MkxQ4/3vs=; b=QniEopKlpB0is7dGiwz2Ufl4d43CEg9
	zh3RTvG+7hqkSgMQaTCAjGnzs18cmzcfnrglm1sv0egokY0U0W7Q9sEOUWtCFJ92
	GtqDL76ZgAqEmw3Gkc9yOXjpp5sRyuhTSniIhBGHV8ll87Gd3gR4jbnZONJqHlhE
	4zbAysa9EBj/JVJqfO8WtIkS7RDb2hrV1cIOYPQZ7NetT+2OG3osurbesx9wpBYi
	vf+1O196dNz2AxNvSt/6o4NITZUyAlOi0ZeS85+BaJVkpubjcy0415lQDf6Tt9VI
	nlBNL//72TNsOAWQBO9FJ21beQQnCuTdLEK/4R9680e6A24MEhFCi+Q==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41n3sd2fqw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 18 Sep 2024 20:33:56 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48IKKkFx015987
	for <dtrace@lists.linux.dev>; Wed, 18 Sep 2024 20:33:55 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2041.outbound.protection.outlook.com [104.47.70.41])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41nyg54mfq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 18 Sep 2024 20:33:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ePEF/Y+ooQLr2xS5KQ/xUp7ZvQBXQIqIcYZPze21Pc9HCbqCUAz/ZsEB5K2uQD5vEC9YGZvrDG+KMoyfQYhJqSie5akT8L4pmSSsDNARILM3ZX9DMvoJKifqTEwffoF322+RZZV+AQajRFn/bl9oa/l/JpPY2xUfgZdM+ospTdBJHvUffU/J5ZDUrwpeFM3Fy5DFmYbg+aK7tPdHgMx7naJrexr1bSfllk2zCfkiuhb/ZbAk8Uw+Y7hbHAf4lRQ5YbriHVIJKFtynkhKfvr1PPo5OBcD/R89IENcwqC/1LaD93K/VKjodlU6Zfal5DDmSCZL0oCdKWxAts2x/hYXJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LwIspBIcDDmEgIPWXnjt5MTujS3KMLqEr7MkxQ4/3vs=;
 b=XRmS145cRYVGWBlerXWe21ngSe5tuHLpaQDbj8dYLP/7N+FC8G+WT4DosrGNS+gT/Er3MYQUO7Pb/uF3IZcRtx5hG6kSqBcgimj2tw94Bzul7r7vHAl0c5Te6jzlct9t9L+vL4gY/bPpJt7cXBq8zF1ibBF2JzoZP5trQheLoyxEPYMAktR9kqAjq6KbCYLsB7usS/KiEFZoSGhByMX3fJp80Ez34aJhQVWGblLKOHvxlqVfY/UUwMxkPoqYtwT/NWGc36SgV6j/YSEo3kQHyXiPyLW8B9K/KRXzKAJqWqeWg3PkKJ0RJNnspWCa76JP8KgLm3PlikG1ByzlDqua2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LwIspBIcDDmEgIPWXnjt5MTujS3KMLqEr7MkxQ4/3vs=;
 b=q2H2wYm3JTk4tBIOstotoLpeAOB1d+rHCAaZWSlYwjnS00WlEO6gREgeb594AC9HxLdeJuFkxgB2ijxSXl1ATlgxwpK+YO3rPg2ZYlorqwkgzfkQWyE2kbxDLSaGFdLEsheBq3WI6k7h7M5fANIudDJh0Us69TccLA6b0eoSWGY=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by SJ2PR10MB7811.namprd10.prod.outlook.com (2603:10b6:a03:56e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Wed, 18 Sep
 2024 20:33:52 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7982.012; Wed, 18 Sep 2024
 20:33:52 +0000
Date: Wed, 18 Sep 2024 16:33:47 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 05/19] Add flag to dt_pid_create_probes()
Message-ID: <Zus5K4R4otOVRMO1@kvh-deb-bpf.us.oracle.com>
References: <20240829052558.3525-1-eugene.loh@oracle.com>
 <20240829052558.3525-5-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829052558.3525-5-eugene.loh@oracle.com>
X-ClientProxiedBy: BN9PR03CA0550.namprd03.prod.outlook.com
 (2603:10b6:408:138::15) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|SJ2PR10MB7811:EE_
X-MS-Office365-Filtering-Correlation-Id: 9da4ee5b-e44e-431e-98ea-08dcd821354a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HQKS5rQDTQOp6TXkVXDIMgvkq2+qNIoXqf+uP910ZhlpyU3/dxDxid1Jh3kI?=
 =?us-ascii?Q?pRHHofBJNPVsKa8GNhFgVuTF2C2jXcCB+qt10TckrK7r6F/52Au5kzznLkb6?=
 =?us-ascii?Q?lffhjrnuMt4y0jzeI2NYOcZLYInbIbvLwuEn6vuoE49SYPt61aBY7f92DzHU?=
 =?us-ascii?Q?kt1h5YsP/rTlR8Dk3RiqBYAoJC+NQo3XVnf1Q/29TlPljW/kmXYYgt60wuYj?=
 =?us-ascii?Q?bb5Yn/gwO2dJIbxP+WB6VxHvdZRMdHXR/LIKIPGwLTWkiEdmBDcZOdO0/KIh?=
 =?us-ascii?Q?mkZpP5QZ6BFGjXLGx2XoU0xWRhno1MapqDS2FRZUVRXh17oiOnwwIV8xDf+I?=
 =?us-ascii?Q?J87ApZKD/uDov47tgU83NkiYAcl3FVukOxUJDywYQHZRas/Mky7EyIxPqlmg?=
 =?us-ascii?Q?6n/brT4XyHNU3MDZgwinOXCcUBnr4ifqxmS50uXVwJl38RSJ197u/g8i7muW?=
 =?us-ascii?Q?szfNUR7eFVt1ELe99LU4Fl13lSC3lP3NlOutxpNXOhzBE+ZpRIk5kx2AuWue?=
 =?us-ascii?Q?RQMq3BPgzKAZLtlxBFaIXTKWb5BRz/Kw8gTFiqqqVST+/pKgCfP3h0OzrFrt?=
 =?us-ascii?Q?EDTXDE5+ykCPRAKHSZV0fHiRcDrvQ0d8z9jduUODBDZEEeERZJVXWcXUd4P9?=
 =?us-ascii?Q?JTTS1etT+Qb29GtMZLjQnt+8ayDhTg7Rs/p76EQXjVFEVGaaRmxwM4Ld28W6?=
 =?us-ascii?Q?vWMQM3p0A2kRsqcMsmsT7nINse2NaVZS/6KnMxsxDEnVlYO4kCBer1tXvd1k?=
 =?us-ascii?Q?COGOr4sp1Gc35+JdMEm3El7FhP2C0XEfiXhLn3ZVwp1/GeOYYmGPphyenmuj?=
 =?us-ascii?Q?BJexA4C94aRqEtSQo7fKsHynSL6yUwR4vBN/CBHHPTC/51LFD+tPpW9rSS0I?=
 =?us-ascii?Q?/Fgn62twe1GAv63xRDrk/+7rMSaICLXIsFxtEs8gnfrilB5lGzin5xGxfyUT?=
 =?us-ascii?Q?bhTZ/J5il5gzg95qoNsTc6JIH03tRw0qbQeYSjOYm2gBkZ3Alhv2qG3MCiBC?=
 =?us-ascii?Q?qFbcCu2DTM7jzFMMj6g7HXwH23JRmk+PUNRF+mPtcguWgF3/r8nxzi2dm2Tz?=
 =?us-ascii?Q?skf0JlCptkMDUfldXs4tLtcUwxr7Ia7sfYRrdnJJhpVHjQu8TINjrw2o/Ou7?=
 =?us-ascii?Q?exEsGdioND3US+O2d1//rPGN0eJhj4i5zTEoyYXT9M0MPTRyW+gsyvFbB/EJ?=
 =?us-ascii?Q?tVFOpPotkRFc6MexY8/BXpLUzjZgK9w/8fxqB0rqBMuOhf+uZBLZyer+ZYA3?=
 =?us-ascii?Q?3ovN+poplPphp+DVflQ8m0zW0QQkLs+BJ+VQeg/93PsEJoK0dTAFQVaMAjeQ?=
 =?us-ascii?Q?0j5ZaY88Kfeqp7qX2f2ZtZccTCu5n6EF5Hu2C3w8Yic08g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?i7UdaXthmK4G3WdnH4WoHV9Ydu1AJjRDA/Nnkk4uyd58FvbSJCtUBBztfbFS?=
 =?us-ascii?Q?ZvjELItUXgw5DO6NYh0lU+muKG/LeJ8+wUviAFPyu+wzUqERJ91ksgJPEdIa?=
 =?us-ascii?Q?DecH//JQrNmHaBqvKJqK1FTUtM6QHlYZ7+kzqkthmScC8Yz2++9fKmDVXbB9?=
 =?us-ascii?Q?e3DSBdECPjIKd8Qe9Di1c3JulVp57Er9s1nkwL03d7Tu8I+MYuqsZ8vDxVte?=
 =?us-ascii?Q?4NIFw9usq4IwjGWxE5nBpYS+MU32dXHkIsl+E4QDLBJv3D/1/JweZ4jjB3YR?=
 =?us-ascii?Q?DD3dOhEC6YD7jNUS1xmLr94RcHVF45opX+JdFh6FjXO4i3MtitSvS0mGes4Y?=
 =?us-ascii?Q?bg0in2gxWs+yiAqlS36WshyeAryPzLdM9HbWxPVGB6vDXntiZhyGQR3zwW37?=
 =?us-ascii?Q?ybq01z2MFb7jAbI6Uj0C7QA4wWwAnGGod+ALtR8+GdlfUXXDzRpKPSYuCMuU?=
 =?us-ascii?Q?sbBu9AO2Mr2Gwfzyn1XlD7mO/lofQMb/XwEUy8OoQWqins5kRBg/DOtNEFOU?=
 =?us-ascii?Q?F6MXUVHVWS4gFDtoIfHuFVK0b6bz05hq4q5OFq2Vd/KBPUzGgNacI0T0XDZi?=
 =?us-ascii?Q?pCmY9wU7YoquPlR/n4hVKzf2oedSeJFJgelIlvnGNjPoiOehf5ERnnXi11F7?=
 =?us-ascii?Q?LisGapQDUh3U9qfhAIShC3r3gQHbW4hdSiadXWDlSF+/z9sQ1SmE7K/oeU+3?=
 =?us-ascii?Q?eqFp4bdtrsLjDkgKCykvKGY1wc9JqPPNn+86X67TAtzrAG4VSM35C5Wy4hnq?=
 =?us-ascii?Q?f2DBzW+QO7gMIkp9QCH3WEcIUs2SOBb4AzsOTnqCLHBPPK6fEBJg8deewm+H?=
 =?us-ascii?Q?H8JRUduJkYewIUyHpfrBEF3dH/I//uZmgEtLq5Eh5CWZO+1NpcBQdqEuA3Wy?=
 =?us-ascii?Q?TXUH/6y5yLTLakT6jbfXUdMGMk4cZO1yukEMqJhHjhLieO4VF5WyMxplb0p+?=
 =?us-ascii?Q?bUjh5jJ19N+f+cdWpzyBMYOVmdeQ5dEtfiGGyWT3rlHc3waBCUUp6EgVoffX?=
 =?us-ascii?Q?3kqtW7YUI/sFr7Hy04sPSWqsXtn7cshbxQ2ePZ7HvWTAvqEyJySNnTSygNvW?=
 =?us-ascii?Q?6xvHpqqWxvwHf1EPXMm8K/b1HnGWd0jqKmbRgNFaFkSUu9lbh9iZV0DZ9zhS?=
 =?us-ascii?Q?0MK5zXIEdIjxh17TbtLr/TRWoUHdlOGKCtbB8M/xAARPNcjGYhpUIPWWd4+N?=
 =?us-ascii?Q?O9sJd7UllGp59v20dt/LgoxncuZUn1qlhpuW1jSUO1WDtqxZHqaG4zf6OsTI?=
 =?us-ascii?Q?LxJosemHwMr5wSR/FYdMT7M6VR5/kjBXjSIZMQeN6OvZJD57FYWKPC/XdNDI?=
 =?us-ascii?Q?0LAa3FlKi0LB+vNyN13GqSfYNguPPGwNRPsQ8/vWgSBRHvlX36T0lYTfhLEk?=
 =?us-ascii?Q?XPtxpwRfw/7TRXUnsyvAzr+2jaXY913bWyitBmNMMXSVt80WFqqiYB+X6jnk?=
 =?us-ascii?Q?B2Rf7Q3Ew1Dg3/1x110ht1zqvZbVKlPNp3HxyFBScX9ce2uG5V34Q7YdbnbP?=
 =?us-ascii?Q?/h1PSvTZi21EKIpqcZAfPwlaUqajD/HL/YkTGQg+wb6A4YkODpj6CoNXTrYo?=
 =?us-ascii?Q?GVW6ySa18tStQTqI/B7h4uzDVsxp3YOw37i15+JAM1IQCg7po5ljtgqYT2ut?=
 =?us-ascii?Q?0g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DdlstzhgSkIIxLbKGLWuEc5ccGSJSAhhBPdc2j3/dJqWa0tQmiSz8XWh8PQ45bvaduVpLu29oM4x0XWXSCn6Ryn8nnkd8CEacMhnIwX/dyHPJQgfXaYW+CNzia9deNpolF8dzNBoLCgCZ1dPJulGxAtI4+euIgGgRiaqA+eiT+g2Dc7D7DudO3m3dkwVKlKLiUmgI0X18qOraQg4lo8pfnEinm8zSsuR+Mw7Ypok2ZR4DJSBAiDe2kA0NQ6aYWBy1JcN9B3vG1/AquUt2hBurL6I4QCzdnNibvB49TEuLLWhL6gR3wSprj2HVsnSfiipi6WmHsBJhuIDsM9/Il3Z+5kwdFYUXw8LuquFpMBdNyb9QfPYkEb8nJbQUz/FLlJWMEH14Jd4lHhNYw5mT/6POe+CGej3uI3d9tr6rEJh0G/v6ixMVaeCogiMBhPMY3NBW009xhXWFBE0hl6iHCQ5PeTgICD6eCiSqK3su3io4Hlo8/+kFwcAUuAA9xa/f3Ow/9/DzYuDjUHWJ4YqZCCSlBxmwMEV38TyX1y4rrw81Et0rcbAFWBgiWtgCi+oaMkiAyqFlHyjRpJPTMO82ZNDjj0z6saT2+x2NsJ9uW2gmFk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9da4ee5b-e44e-431e-98ea-08dcd821354a
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 20:33:52.1000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qg8fQPF47kfOTIj0y0gVKaKxFyT691lQWMmWdYXvzeqVlYN9kMvRf7jW3c2AR5omUKggEtXMPSCExcK1DhpTU4R55Yaxyid6JijxTLm51Bs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7811
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-18_14,2024-09-18_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 mlxlogscore=801 phishscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409180134
X-Proofpoint-ORIG-GUID: TcXph525WEobjYQ7OhEejT4OH4HLFgM4
X-Proofpoint-GUID: TcXph525WEobjYQ7OhEejT4OH4HLFgM4

On Thu, Aug 29, 2024 at 01:25:44AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> The function dt_pid_create_probes() creates both pid and usdt probes.
> Once the dtrace session has started, however, we only need to watch
> for new usdt probes.  So add a usdt_only argument to the function.

It would be better I think to create two functions, one for trying to match pid
probes, and one for trying to match USDT probes, and to call those two functions
from dt_pid_create_probes().  And then, after tracing has started, only the one
dealing with USDT probes needs to be called.

> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libdtrace/dt_cc.c  | 2 +-
>  libdtrace/dt_pid.c | 4 ++--
>  libdtrace/dt_pid.h | 3 +--
>  3 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
> index e66d76fb..cfd4d3d1 100644
> --- a/libdtrace/dt_cc.c
> +++ b/libdtrace/dt_cc.c
> @@ -282,7 +282,7 @@ dt_setcontext(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
>  	    isdigit(pdp->prv[strlen(pdp->prv) - 1]) &&
>  	    ((pvp = dt_provider_lookup(dtp, pdp->prv)) == NULL ||
>  	     pvp->pv_flags & DT_PROVIDER_PID) &&
> -	    dt_pid_create_probes((dtrace_probedesc_t *)pdp, dtp, yypcb) != 0) {
> +	    dt_pid_create_probes((dtrace_probedesc_t *)pdp, dtp, yypcb, 0) != 0) {
>  		longjmp(yypcb->pcb_jmpbuf, EDT_COMPILER);
>  	}
>  
> diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
> index 996543b1..3f3453af 100644
> --- a/libdtrace/dt_pid.c
> +++ b/libdtrace/dt_pid.c
> @@ -1095,7 +1095,7 @@ dt_pid_get_pid(const dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb,
>  }
>  
>  int
> -dt_pid_create_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb)
> +dt_pid_create_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb, int usdt_only)
>  {
>  	char provname[DTRACE_PROVNAMELEN];
>  	dt_proc_t *dpr;
> @@ -1109,7 +1109,7 @@ dt_pid_create_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb)
>  
>  	snprintf(provname, sizeof(provname), "pid%d", (int)pid);
>  
> -	if (gmatch(provname, pdp->prv) != 0) {
> +	if ((usdt_only == 0) && gmatch(provname, pdp->prv) != 0) {
>  		if (dt_proc_grab_lock(dtp, pid, DTRACE_PROC_WAITING) < 0) {
>  			dt_pid_error(dtp, pcb, NULL, D_PROC_GRAB,
>  			    "failed to grab process %d", (int)pid);
> diff --git a/libdtrace/dt_pid.h b/libdtrace/dt_pid.h
> index 497c7751..dc200f4d 100644
> --- a/libdtrace/dt_pid.h
> +++ b/libdtrace/dt_pid.h
> @@ -16,8 +16,7 @@
>  extern "C" {
>  #endif
>  
> -extern int dt_pid_create_probes(dtrace_probedesc_t *, dtrace_hdl_t *,
> -				dt_pcb_t *);
> +extern int dt_pid_create_probes(dtrace_probedesc_t *, dtrace_hdl_t *, dt_pcb_t *, int);
>  extern int dt_pid_create_probes_module(dtrace_hdl_t *, dt_proc_t *);
>  extern pid_t dt_pid_get_pid(const dtrace_probedesc_t *, dtrace_hdl_t *, dt_pcb_t *,
>  			    dt_proc_t *);
> -- 
> 2.43.5
> 
