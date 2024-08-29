Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D334A00
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724908957; cv=fail; b=OIgjYbopXULX27BxSP1mWFa5yyKTQqTYcq0XyLbhHF3mGuZe7XV4aUvd/YOPC7nRhHdNrOkSf5m7XRlLAsuufUgV8VHTTqfGa6nMghSfqLk7+qvIgk79v7mUQrZ1gGTjcgyZsMNBtL16r+qoMICn7Cpjavhwe/9ICe1sDQ4tbOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724908957; c=relaxed/simple;
	bh=K3j9MPiP0zAYQlpLZYt7bVBykxFiP6Y+iLwATCZ+XwY=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HsbO+BGYv00hgtnf7J/EIeb8KGLoym6S+yORocT4dKKVd5Qql7bvt7FxwwO6dxMqpuGIpzMCYW63fYN+5F8n9qwyJYVHScFMUTugcc285cOeQYV1O9GP/ItdBWcv+vb3roXMs032KvrSqA7AKgmpt947tScadZxEtTFDe3SpQmQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hiSto5Dk; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=VrULuaAe; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hiSto5Dk";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="VrULuaAe"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T1fYc2030244
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=WZQNLnlvpGoWPH
	I+AzJ4ywQig8pfmx/0TTbVRdzWAHg=; b=hiSto5Dk92iw8VUqfZrMm1stsZPQsR
	MOy8uKgGqxcTKOy1Epgg0aJgNaQyEbFfTkHW+ivjSxWU1pdtuC1uf0LgSelx3Ebh
	GOViO5gKm6oL2+sjcozZogbarCuhB8anbout3M4au+MpFz/0Vtd/xq803ZrhVDyy
	31QBJoWU+ZJ2xiji+q9yqatGGwvxWvGwMLDXfnrZKWJnDR10DZCLZJ3FEcjP5I52
	gIfInB1FmpOCCPXnqhqUasjxW7TJEm9iz+ZzmozQJSisxNngbT2UWy9HD9nxN/OG
	xhbKg/JyxrYB744vxgaFG3hRoVmGMj5OlxErUxkMjRDnPBlDKaP3B3qg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pup3bhs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:35 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47T2jWba031872
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:33 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 418a0w80sn-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A9twZTMHomfBCMVtZ2Sy0TaJI/PMp0Je4gJY8tgV/gNDUGXehjpILb/vJ8JvX4daAMZB5/olmuHZdESRR3LTaZp4C132IYYakPPClMLh2ohLv5VTqooUDwZ3tGZkW3PQlhylpD9aeUirgj7Si59l/r0HD354ETMzT6+nz0o6LQkqdLjQMU8TbUe217zyUJfKzmi4rojVTFBN/tvPO40vTyEKODkfSyoXN20XuWzBZzwIbslcH27pTFfjUMUJrqUgjbMC9+25+lz/YYES6AuKW277ev7e45rL7FjzM0fGNvK7wN9rS1uS2we/RS+2GLGLo5NEVZL96mwbgwz+jLZz1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WZQNLnlvpGoWPHI+AzJ4ywQig8pfmx/0TTbVRdzWAHg=;
 b=cmHOvT6XUr887UNLCQfKs+Uaia1xcSSjaKdlBG9AAVxjA7YbjELEjKFukNke5jT99i/qokfMCy4tDdEYnxYYawNfH/6m4PQc+UTb+G2/ZMfn2ZW4h/9K1sCAJA9WuoN7PtM5bC4D6PHJcoYwEmkr7p51uccvVhbh4JUIp4JVlgYxpmDYVWPENMga6n++4Dh3kUONIEjuVFHF3qTS03DKp142xYyDdIiWqnUb96APmgmeW8X6dJcBDZJPXVToQih/4/coS+JIwQGxzmnsEZf8bMFnAxu7wtxYI7Z4/lJuTbvCU0RK80lc2uhvEuiCdfazgKCFHGJp9kWqOze5ozwpcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WZQNLnlvpGoWPHI+AzJ4ywQig8pfmx/0TTbVRdzWAHg=;
 b=VrULuaAeBC03PBkNzxBOUnrCwCbEyGo/1WHypntjB8bgmyVyuL8mjTpDxh5jXgQJKqXeLPNRrkC0yS4Ez7nmOxsp1HsubzxvVz7nbqMU+sumSPzygIH5BQcJ1yw6BMInwW6Pfezmf0RsZPg0y20q4t7TFyh1JidbfZCXXwdzcwQ=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ2PR10MB7656.namprd10.prod.outlook.com (2603:10b6:a03:53e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.14; Thu, 29 Aug
 2024 05:22:29 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7918.017; Thu, 29 Aug 2024
 05:22:29 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 07/22] Supply a default probe_info()
Date: Thu, 29 Aug 2024 01:22:04 -0400
Message-Id: <20240829052219.3234-7-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240829052219.3234-1-eugene.loh@oracle.com>
References: <20240829052219.3234-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0036.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::49) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ2PR10MB7656:EE_
X-MS-Office365-Filtering-Correlation-Id: 442bd407-e518-4831-c6f7-08dcc7ea93dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ww8Xg+mqGaEXsoVSujiUKtNqdKoEzPmQgQmXDbJ0H1QyJjwHUyLeQpIGLK3I?=
 =?us-ascii?Q?oZRXtD5pnWngO7oOHacUfzcxcf1tM+uc2bPVAP8/szOfGXuodmpj+XgAk9C8?=
 =?us-ascii?Q?TLalKgFY7H/zouyZRb2mCX/xPf8TJIq3NlrlY6tvejLc5cjLN7A3jYQCnMS5?=
 =?us-ascii?Q?f5kI6Od39qBmGm9iyr74/MA8MtCgKOdBl3pxFjUr4B8LO+iUY0D5e0vyiF6+?=
 =?us-ascii?Q?m6EkRy/+qSbhunvbsqE1+dA1KpQtUnkxcdKBmgAwNXNiasd3mvzlOPXbxPzZ?=
 =?us-ascii?Q?8Pv9JJw7XyiB+4UTRudccg2HkKe9S7TZYifZLCGex/b0WHv7ymD1fEh8fl+X?=
 =?us-ascii?Q?gwQTFwLRVXngetOz+gBNYp/HR0t2CHUqhXiptaen0dlPhHPK3XkyzA4q6TzC?=
 =?us-ascii?Q?YZKiiK3++OvmlUidcUj6D1nq5n4ObMW/D6Lf934dLvrcS0EdbmyXcRTumWxg?=
 =?us-ascii?Q?JgL5L66JlFI+mTbqP4KZI3wjdWu/eSpcbnsHVjIdctY6ipexNQWjG4k+iWDT?=
 =?us-ascii?Q?3s6qH/MkuhpfTTqr3wvx2h0C2Vz76M1iScBuCH0saWyLPCjiIEVVPAViYuUx?=
 =?us-ascii?Q?VBu5pCKT9iD+f6sYGbf6MFacDkxnEat3p44KGhSa073Cjb0CJx4EayY7toPp?=
 =?us-ascii?Q?Galj6/ImYXaMNlBm4gGtTamA7eCRkPqVezxhvEPT3RxT3qmAvQsHpA3n3qr9?=
 =?us-ascii?Q?LvRz94Jpw3hBz47aD/+c6FS+qJ99K7G/8S8qYxzzqirES9pZ/8lX9zdUBnn6?=
 =?us-ascii?Q?8CDtT2zJct92t7qQBcpQ3XCURtEwT9Q2ox8GqRO5nETQFNv4eM2zS+OljIEV?=
 =?us-ascii?Q?csm2pnxFD/kY/PEpZM7NnQqNSCBlBMR4K4XR3ssfLPi/OvQ4c9gf/Ku0IQO1?=
 =?us-ascii?Q?j/3KsmQaePowe75wlWWE3QUnpfI6OHxAjs8uskhBLr7Wz+Rpy9p6QPlQTno6?=
 =?us-ascii?Q?8EFqeflt1vCvaLViADuiekzb9b7GqKp0TzTlI5WHB577L35jBaLLYO0FuBfV?=
 =?us-ascii?Q?ebftEmqUKqMnLImT9sbPAZw7uTgkAfbAos8QLrDW7a08eJ4cv3oWirXN4jVG?=
 =?us-ascii?Q?xRhuB6XyiUgY0RPG873qWTN4EODJpEg501oIeGialRrHh/BdCkASYjnq95PR?=
 =?us-ascii?Q?qSV11d8dIB8uZuaUSbt7V52WK4N2RRuPR7daV+iwFkFabZmJ7uu2IrzXfV90?=
 =?us-ascii?Q?UEaasUtnpWe8cs/pRZ8cWzmWMzkA7HDP/2LigV+hbA51rolMIWDu0WIgjcEF?=
 =?us-ascii?Q?rXfu4PkAfV55A4wCZQZpdgk2ebFrdNhtKM8k2lwy7sm4q/+GM26CIb6fYSX4?=
 =?us-ascii?Q?lvh1ir1pMSnv7fDrTQpgBDNMdsOSpeYhDjYVELY7mL4TOw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sYFb3aga6JVlueXGcfFJcHjLQrZ7hJ4VakZemOAb1ZHSsHj1ABTsH/oYr6/w?=
 =?us-ascii?Q?lgOd8xRfP/uK5rGY7RUdBEZ3mJzlBH0AhoNSJyopXzZPbQI4AXfhAhFOu7hy?=
 =?us-ascii?Q?T8HaUw8lxHNioLBEQ7hHAQkmqp1/C0QRghA0UjXlVCL9YFkmqh8zHxhheaWd?=
 =?us-ascii?Q?C/ar+r5Qy2MvvtKxakLlejMbBzLicjDkt4WgjOJme8u2XaJbpag6KxZ7DhPo?=
 =?us-ascii?Q?uYZTM+WMVS4RAKgQualn0SlK2DQ2RYdj3BCktqsdtEi9Y5TnNwcPEP0lQy2Y?=
 =?us-ascii?Q?W/tBXKwjxk3A2YL4kKHoheDwZfpdYlTmXVhfBEqrsaBm6YMtfQLBqC5FVdrW?=
 =?us-ascii?Q?dEOmfl4ue5RDw27bkzJ1eeTVjTA1uHTGDiTExCS42yMiO8cu8CdZ2gkINg1b?=
 =?us-ascii?Q?JW7hrcmzoUF3BrB+Bij9esOceWQZI8x8amGG80OcZgWYJ3xBVThGbJQPnMhB?=
 =?us-ascii?Q?qdQQssKcuSn/0IPffK0N0DkUeClKXR8qhaxHTgxwyk26Zv7bP31VIPrU0CE3?=
 =?us-ascii?Q?ZF2WjAf7I7FYVdNnBfyMsBYcrkus5ISuetDY5cCSe3h2XEvwzLp4uVb8KF/8?=
 =?us-ascii?Q?sbBpqS9itDxLAoufla3Aq0UO7PBPs1gF7EdWf7HT0UlDOGokNqBQYMEgcDH5?=
 =?us-ascii?Q?f0JzK05OQ+Bu8xjAF3XR2h8ygVOP1vnudqL4a2RGulEV6nE/yK1wBM4Qf49z?=
 =?us-ascii?Q?38W5Pj07uAc2NxrAd4BXsc6byL7AK4c7fHBOHz83N/OkeCoiBUxc1i02awuc?=
 =?us-ascii?Q?07mWazUhuN579wc9ZVBh1T8vNM9TONJrgzogc8jMzJn+PGPR0dLN5nDb48Me?=
 =?us-ascii?Q?2mP3/7ZIolqV6i6XGEw1f9kJpdt6e5JK61pxckkBZpvtERGBQalzmrOe+LDS?=
 =?us-ascii?Q?JJVOGsXo75rPpcMkF3LiBhL6F/93Z7LkvpzaSHQUJgYVvM8/y3Y4RIZ2IOD3?=
 =?us-ascii?Q?tfAK/Q+4zFv+JjHW+rzRGQ6IuN3AoFw2S0zde0E+BnkafS4uafPdATpYbJLF?=
 =?us-ascii?Q?SvR+8A+gPamhK2AKgJUMl54kb5entNsWKoRY2qTEjbdhH975oHNNkXl3HOBS?=
 =?us-ascii?Q?fLtiLPtXdGTaR6p7nzdDShXs9r8Oa+8yOAj6CTrCBZwQ7rSdjCPQAnMiyY4C?=
 =?us-ascii?Q?2I30j55uWQx8KBvkdWtnxhyFdPVWz92mEYMKNVeti4WzaVNloOc+M0S7aeL2?=
 =?us-ascii?Q?caolLyvIA5xAv9hTQ2i4MjNwl4IztZQpJ3MdVlwP/EhM8IaP1BXyAJ9yj9RN?=
 =?us-ascii?Q?jsxOALN1nzRaGDPbVLttKlizEmGll2vytOBvSouXIw2WkOp/UplsfkQCdTTv?=
 =?us-ascii?Q?ulHQ/fB9LKZl4RnRqpJUUek45hR0fPJhSat8/ShI0L2YJwd+ayJ6UmWt8uHA?=
 =?us-ascii?Q?98vSHAsmlo2+WNeTm8YdHrXJaXV016jh0AM0h60skVHwO0Pf8by/rFDk0+xi?=
 =?us-ascii?Q?9Tp87b1r/MWehXrwkk0DUJniv19lRbiqOOAc62spGLOx/lhj0JBTbi4tXp+x?=
 =?us-ascii?Q?qZZljQSd2vUVOXHHAWtCfhs2gFwBZU6t2MiPQ4ciphnv5o7MTOeL7xAu5Nxb?=
 =?us-ascii?Q?NBQ2WoIlxfCnGifA/4ojPdPiDqdlNiDtnAa5ei2b?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WsvyUC1nx3jZj+HnUiaArHLSkwxh1ZgSik0BNknRJ+sFmmizBLiIHmuKvEMUtS03qDda3OnxxfaIgflgMDuj+VFRlxNiXaq45FvQSUbRbUW085iKqELnKNC0KZR2ji8ZYRUgbZjJDoL6IW9iVEZwAZ+aVRnc51gu/igWQT4Aj5cv1P2WaRuoiaU+BEclssidY0rtY88DnwnMKyK9GPEsIn+Uwk0zkramCN7X4YXliKv9HfREg4kCWhQq+kXCCCPyJzb5oo3PdqU9sJGlKy+05kmC+lkyA2Q0bIz41yp2SNm+Yf5Kcd5P9CivWzfZKwH9fiUlPWayMI2I5gKF2F6YcPbtWrWqJM51fuEco3OhKPrVwFysszOy7eZQfGsO/VKDpez9CQodV3/XE97n/aMgNOuMhWUNimXudo9jid3yjEBXDDReGsfHYW/kJ/Qx2xveCmvPTXF/vzyyX4Pyozu4/s1aZTU2G2k+JMfRG+ZC8mZMiAzUhRci2IiPbbiAoWQiuNdSOW2/l5Up1/FHQk+faIJ2v5PZwxRrtnTIQqpzpd541iVHOS0jAzUn/DPwilupK8ymufrqU7h9YpmBTTXy5s3JFFTZhKvdF9fnYZPkfcU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 442bd407-e518-4831-c6f7-08dcc7ea93dc
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 05:22:29.7629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hA/7sdxlAvvmL522ycadd17Ar2iZsUYp+GQt1eWU1OSQXvwFdK5Z2zD+OhvV+xyMo2OrnTbIAku6sdU4LJpa3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7656
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408290037
X-Proofpoint-ORIG-GUID: 1DHeJ_Auh5ENa90mhxtxvqkrvLq0mUYZ
X-Proofpoint-GUID: 1DHeJ_Auh5ENa90mhxtxvqkrvLq0mUYZ

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_probe.c        |  4 +++-
 libdtrace/dt_prov_cpc.c     | 11 -----------
 libdtrace/dt_prov_dtrace.c  | 10 ----------
 libdtrace/dt_prov_fbt.c     | 10 ----------
 libdtrace/dt_prov_profile.c | 11 -----------
 5 files changed, 3 insertions(+), 43 deletions(-)

diff --git a/libdtrace/dt_probe.c b/libdtrace/dt_probe.c
index 0b53121a..ab90d2ed 100644
--- a/libdtrace/dt_probe.c
+++ b/libdtrace/dt_probe.c
@@ -892,8 +892,10 @@ dt_probe_args_info(dtrace_hdl_t *dtp, dt_probe_t *prp)
 	/* Only retrieve probe argument information once per probe. */
 	if (prp->argc != -1)
 		return 0;
-	if (!prp->prov->impl->probe_info)
+	if (!prp->prov->impl->probe_info) {
+		prp->argc = 0;
 		return 0;
+	}
 	rc = prp->prov->impl->probe_info(dtp, prp, &argc, &argv);
 	if (rc == -1)
 		return rc;
diff --git a/libdtrace/dt_prov_cpc.c b/libdtrace/dt_prov_cpc.c
index 08689b35..8f33cf58 100644
--- a/libdtrace/dt_prov_cpc.c
+++ b/libdtrace/dt_prov_cpc.c
@@ -451,16 +451,6 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
 	return nattach > 0 ? 0 : -1;
 }
 
-static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
-		      int *argcp, dt_argdesc_t **argvp)
-{
-	/* cpc-provider probe arguments are not typed */
-	*argcp = 0;
-	*argvp = NULL;
-
-	return 0;
-}
-
 static void detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
 {
 	cpc_probe_t	*datap = prp->prv_data;
@@ -504,7 +494,6 @@ dt_provimpl_t	dt_cpc = {
 	.load_prog	= &dt_bpf_prog_load,
 	.trampoline	= &trampoline,
 	.attach		= &attach,
-	.probe_info	= &probe_info,
 	.detach		= &detach,
 	.probe_destroy	= &probe_destroy,
 	.destroy	= &destroy,
diff --git a/libdtrace/dt_prov_dtrace.c b/libdtrace/dt_prov_dtrace.c
index bf87cb05..a9deccee 100644
--- a/libdtrace/dt_prov_dtrace.c
+++ b/libdtrace/dt_prov_dtrace.c
@@ -273,15 +273,6 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
 	return dt_tp_probe_attach(dtp, prp, bpf_fd);
 }
 
-static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
-		      int *argcp, dt_argdesc_t **argvp)
-{
-	*argcp = 0;			/* no arguments */
-	*argvp = NULL;
-
-	return 0;
-}
-
 /*
  * Try to clean up system resources that may have been allocated for this
  * probe.
@@ -317,7 +308,6 @@ dt_provimpl_t	dt_dtrace = {
 	.trampoline	= &trampoline,
 	.load_prog	= &dt_bpf_prog_load,
 	.attach		= &attach,
-	.probe_info	= &probe_info,
 	.detach		= &detach,
 	.probe_destroy	= &dt_tp_probe_destroy,
 };
diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
index 62c568ce..21f63ddf 100644
--- a/libdtrace/dt_prov_fbt.c
+++ b/libdtrace/dt_prov_fbt.c
@@ -411,15 +411,6 @@ static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
 	return dt_tp_probe_attach(dtp, prp, bpf_fd);
 }
 
-static int kprobe_probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
-			     int *argcp, dt_argdesc_t **argvp)
-{
-	*argcp = 0;			/* no arguments by default */
-	*argvp = NULL;
-
-	return 0;
-}
-
 /*
  * Try to clean up system resources that may have been allocated for this
  * probe.
@@ -469,7 +460,6 @@ dt_provimpl_t	dt_fbt_kprobe = {
 	.load_prog	= &dt_bpf_prog_load,
 	.trampoline	= &kprobe_trampoline,
 	.attach		= &kprobe_attach,
-	.probe_info	= &kprobe_probe_info,
 	.detach		= &kprobe_detach,
 	.probe_destroy	= &dt_tp_probe_destroy,
 };
diff --git a/libdtrace/dt_prov_profile.c b/libdtrace/dt_prov_profile.c
index bc224348..e1369ca9 100644
--- a/libdtrace/dt_prov_profile.c
+++ b/libdtrace/dt_prov_profile.c
@@ -299,16 +299,6 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
 	return nattach > 0 ? 0 : -1;
 }
 
-static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
-		      int *argcp, dt_argdesc_t **argvp)
-{
-	/* profile-provider probe arguments are not typed */
-	*argcp = 0;
-	*argvp = NULL;
-
-	return 0;
-}
-
 static void detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
 {
 	profile_probe_t	*pp = prp->prv_data;
@@ -337,7 +327,6 @@ dt_provimpl_t	dt_profile = {
 	.load_prog	= &dt_bpf_prog_load,
 	.trampoline	= &trampoline,
 	.attach		= &attach,
-	.probe_info	= &probe_info,
 	.detach		= &detach,
 	.probe_destroy	= &probe_destroy,
 };
-- 
2.43.5

