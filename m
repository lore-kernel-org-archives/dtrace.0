Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033A11E3762
	for <dtrace@lists.linux.dev>; Sun, 21 Dec 2025 20:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766349446; cv=fail; b=JUdeuIf2wGS41ZtgQGtECLc64c41gUbkpvPrsJcuk+2OU56W0L1EhEbxkBRo7/2IP6IbhnhsLRYaN5xr/o0extJhbGctQwKLXfhlWLeU4gS3EoJOSQMCLSHSQNTVAuXGxAE1ujODuzq5s1i0JIf0MP0TQid5caF+zpaZyy0N14U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766349446; c=relaxed/simple;
	bh=HoMxMuwyRc7fzmER0xBov3UsPzK5Ra12fQLEGEBQ6w0=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Nf0tYBJjZVQWHTF4s5LX09pyxGemSZc1RKpzqTuZHgJsQbcXlEyXHP7TJqG5NmoZn4gwSdS/bJPKNbcA8BzI9AhYA3WsfulP9+9um9FEhooTHH8v7kcw1kdfAZTVMSp9JEKXQVncI+aSImLB6V84Cm7zJWCrqmhKEJ1qHoLb1Zk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OOrFBZ7q; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=yOndKaWK; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OOrFBZ7q";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="yOndKaWK"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BLKVoYr519328
	for <dtrace@lists.linux.dev>; Sun, 21 Dec 2025 20:37:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=H6h0fltxHjr0n1jStXOXxjGXh5aMpzbAfFgd6QFLATo=; b=
	OOrFBZ7qtUSZV7wQdIkdblUZfrbwaB/kuVcabptqaFglIHspyl2aaKYnYjiCHhC+
	p78/IKhK4a2aeJiQ0sWPqiG9k59awp9AhL34lBQ9+Ct6eHLmuUAXtalp15KgoA4T
	r7xqQTXhiRregXrlLk/yH6Dyg3q/hVaUZQeTZ7zBmhEWQ5LVLqFoiQAMQw9dXQ5K
	ozCrJ9WJ1MzXc2NtK8NPAZBGoA3Cs45Y4/cSKr6JAwJEqTZ0+wWtrstdY0BkIlUl
	hF5zrGoXut1xzFWYMOqvbwhnLlWbq54cxUQEdATsCW+AqCz/H5F9Ycy259tanBT0
	GYwxIwfgbTwednYB6mryLA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b6q3qg1sr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 21 Dec 2025 20:37:24 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BLEdBsx002402
	for <dtrace@lists.linux.dev>; Sun, 21 Dec 2025 20:37:23 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013008.outbound.protection.outlook.com [40.93.201.8])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4b5j86pfjf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 21 Dec 2025 20:37:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OwY7mH2MfXmgwOb5/s8vPHLG+Fbnl8f0jv232Ha4dYBA9KFiP55GuhNkeAWyBI1GgxVr+nqD8Q8uiKG7IgNg2xbkDSpMA1pxCGq8QAZuAGigK6jMJQGZ0UX3QH4O97h/i5UPDOYspRY5IrsN/Cdd+2a38ZI2catvUmIanPcse72aEsn3nj0ggvj9Z1raQDv8XlKCrMWm0+gBWa6bY5CAGmYHn6B4B1IV23DKW0Hu5D5nPjxKanztTsQCH18RnmJ2+Nm68JDmu22HSx8fI6be0kliVNRNthfXCVfmHWDq649PuWny1zNlSCna98loSihglP2WLPf8jEZiGrbVHLb0mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H6h0fltxHjr0n1jStXOXxjGXh5aMpzbAfFgd6QFLATo=;
 b=g4LhiyOJb8alCDStSzFMTqDlXtO77JRJm76to+xDVedM2GU85soP/nREdKBjcxQghNrRNThqRBVUA65+2Q2M/o8p9gTQF93Ryxc3J5rkI1M/4qMiyeuXSZeJsO4N9ys5YhUyssHqSa//tFgqdTpZX7geOzvqEz1bM5CYycN0+hHB7FIsZDTJ3O4u+rBtCQvfewBtrXnTvaimuUPeW5KSeiihVaO+HX+rAHVxvuZHM6kIDMQGDYh6oNpBnR2dZdZ17yvTFIZ/NW7WxgpKhMJ46cenlDJ3hCln0X3gm1loK+ZW8vyuwI+QkLKhXoC+ZqFWH5mHpBiJpjmVt6SBD8wFLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H6h0fltxHjr0n1jStXOXxjGXh5aMpzbAfFgd6QFLATo=;
 b=yOndKaWK+VY31eJXuXLPUpHgUmHlooxaE19woM0SC37OWisjPa/D9V59KTuij3P6NZSUBku1IRiCDa+E5v5s5L04R5GFbCxS9mfgJH4JHaaAF7okw7w/u2u4RuXRk6HbjnUT9L1ch3oJ4PgsNzzBWBm7bxQfhEpE8oNaYiJuvNQ=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by CH0PR10MB5148.namprd10.prod.outlook.com (2603:10b6:610:de::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Sun, 21 Dec
 2025 20:37:14 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%7]) with mapi id 15.20.9434.009; Sun, 21 Dec 2025
 20:37:14 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: Remove args[3] from sdt:task::task_rename probe
Date: Sun, 21 Dec 2025 15:37:11 -0500
Message-Id: <20251221203711.11353-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::13) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|CH0PR10MB5148:EE_
X-MS-Office365-Filtering-Correlation-Id: 81da087e-0a3f-45a1-e6c5-08de40d0b925
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?x7/kL1Q9PWoUUECMW+RcOTl9AXhhegHWD4UkbGqteotDGhY14ng7PVsuDeOn?=
 =?us-ascii?Q?0gzv/olJ7FGLxeWkrPHH8SydRKPOgSYi6SiNjXg9+NwhJpDChmAPlW9vy3EW?=
 =?us-ascii?Q?4C+WdnJ0dQ06IcBjF8PnELEXeQnZPL6dOACllxej4faHR4gbpADTp7/fO1nx?=
 =?us-ascii?Q?F4scePjh4yx/g62Mad/48Aj6+uKSl3UxGuHoZOLngnGaj6ybeHFxXgGJZOJ/?=
 =?us-ascii?Q?YKGMJlQU0x3wIPMzlO9sBQyWw/AfGC98vl7Mxv7S3luGCcwk/HQ2WWLJVj4+?=
 =?us-ascii?Q?bhXeC014XSCtzVKIQ3HDgTKUwYnMuAMaam5O0i5PWkX7JF/S3UsBUnhKkgwU?=
 =?us-ascii?Q?Sr4GiuFpty5KSsnKZ5uth/uzAcMsYjkQcyZ4+nAUAbTmpUX2w4OoJtEMnt1V?=
 =?us-ascii?Q?MPCWdEpilQtoZ/ZEnE6fpuNiwylS2BTtnKLD6biF1frZNuRjpt3/+gC3sITX?=
 =?us-ascii?Q?0QEPLtDe5bL54z8Rz2QUOen+O6Hke/jfosVyH9gDbafQb5Z7BmF9jyCcHrxX?=
 =?us-ascii?Q?cZ/kCd/yxWEBZUMo2VO7p4WJh5eLFB3dNw5f1GetLJTHijFoSWJdL82LPaR3?=
 =?us-ascii?Q?UlG8R46Qqm/R8gF06xdtblRSSi9ymHwfVnx/JXcQS5wtTe1cwtGoSfeCm4xk?=
 =?us-ascii?Q?kIZvq1Dm86FVfG/StG6hKpa6bJgT15Av2MDmCmYSyd2HV5cZMBF37o7BIbm7?=
 =?us-ascii?Q?ql52bI5QtoyKztPp8mwanxQTD2AbxN9fapbEyzJmL30FO2G5P81bTpJaRrX7?=
 =?us-ascii?Q?m1k8K1g2p2OBlXvngRUkfHtNf0xEZCBGek5On5YV44aMPt9/oLt82KutkhZL?=
 =?us-ascii?Q?qD8PPWMJbjgWRzuaTMQs4TkkhmucrsMTKt8msTZkrxaRKHdl/o1F//Rdj/+S?=
 =?us-ascii?Q?a81iWxQu1Rd7e06Rj8TxZGAoMS50KBAiNOOn1xxI5pRxDqJIttElDKLSbZvt?=
 =?us-ascii?Q?nWO1wEvjp2HOPIOOuxLeWPurzDzyX1yzvPUQoRxufI+fA4WJrfFcsCR+scSM?=
 =?us-ascii?Q?EFl52sTIW3Yr8ZELNa5nwLqCQIXEkTjMvhTHxpV3OY57mpOfMfi4F8GAscQs?=
 =?us-ascii?Q?+zTO1nonPg7znjhDq2rXY1xqFuJezMtS7Uv6O62C9leNHREby/hq9t8midgj?=
 =?us-ascii?Q?C4Y5sreWMG1IbNIRvHVONNEhmzYhbDv6aH47f9Y0Qu1qivxPyBjMWbc6XpTp?=
 =?us-ascii?Q?vdtnG6M70e80a/J+y40P46b+CDWqlIU+8pobb6ZXdxG5/tgcAu4GqUIfG/Hl?=
 =?us-ascii?Q?4Frbut0wFlzW94Pq6OqORxxKTLd4r6LCPoFfDbZtMUTJkp2B2VVyccPTxAVE?=
 =?us-ascii?Q?3zRFDIFjIi+3M0tOPx0jWKEBHkjsLSU6WqDIb4YB/231/zSPEEbw7Y+Ob94y?=
 =?us-ascii?Q?5seZFXp9Haq89A+HmbL5p7V0VScNRMCLl4d+OXowRjqDbFtfy1Kh4vB6zgkq?=
 =?us-ascii?Q?ExvZmYF2OQJOEzlpZIlsW88Ztmxaw5anSYabjRGMAQN1Tf5M5gBhNQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RzmkIoXNJozMYdMk0bokzt7ERGYGFNYyQCNLkXtxNaogb8w1dhIYMgYe71Iz?=
 =?us-ascii?Q?rlitQCglgk6Fi2OhupBlAOPkODnydZ7TJjU0H856tvOLQ7I5SeAxawqfkebn?=
 =?us-ascii?Q?U6ySS5vqNMejHAFpP4YWXWpqrKF79d2W6f89P3ldPjbN/9vO6E91yfaEKS5R?=
 =?us-ascii?Q?8vAeV0aW/KwfXCe51x3DT81XiH6p6K/KSO/WfJZ9rioMDP0DBxyWsTOx4zmP?=
 =?us-ascii?Q?bRUIxLuOrrosCL2rz13dRJkkoQHU0skBMfO/1PJp43mAZPWK8dKQpeJ0NntC?=
 =?us-ascii?Q?1Ylyt+O+h0e81Goz3xpnkBrtdgYtzw0xOhjYblkn3AJGB5wj4j9fsL7QeLZr?=
 =?us-ascii?Q?ZVVz1evz6T6OAmfMKcOYRnn7+OEzB+ZLDKfydmIlfWnohKWqlJ59+zFFh6nB?=
 =?us-ascii?Q?xzDDQa+98kTZ7JC1UPGzhTqR0eWWp55uBIo5TOHD0ARckISljzZX0LfXaoX8?=
 =?us-ascii?Q?innN0pdHQ9sm+qbChVKPvyZQT7Tzl3K7eAtA/guw4g/xfNg/8fzFJjaLijeu?=
 =?us-ascii?Q?8Qgrys/oyO5tR9oGwvkJBDqSoY2U9AcVEJgvtYR8127mkHcQvkAnjyOQknRI?=
 =?us-ascii?Q?mcWxdhmgYg18RRhLu378lc6EHlurkjz34nn8givRSj4M8x2wEJ0A7ODVLG68?=
 =?us-ascii?Q?EJXysvLVRZkT1ZBwktFpfw1rOqRpWZcvjqFKbu6zRJrh/cG+0oIgZ9JZqeKj?=
 =?us-ascii?Q?zGxjLo9X66Os7rO5Uh9eMeur59ubDgFgXFBtXcfJw2nzGNMSdLAWLlKO12il?=
 =?us-ascii?Q?9KNizfjZM3nn2NUeivQsu+Vm9LKr55NEfNC1sfXFxJvZGamAogadxFo3dXgC?=
 =?us-ascii?Q?m6wp2IUYxQ9lZYzb8RqKDfEA100MPZZBqVCccHHs6NuuVhYclK1OZDNUMl9G?=
 =?us-ascii?Q?LaBUz76QDhnujfX0C40l6165UTQE0LnUqeoLLsHdC6XJr7VrMW78+q84OXHc?=
 =?us-ascii?Q?cDLpPhdenL2hQXFSbuK1xsXWewn0pGjrj07GQWq9BAX0Dn9I2AIcjAmurnc3?=
 =?us-ascii?Q?4haVR5GJ9+zLMUasY89bh1A9UiNGZKhvi1t4u0U75J1xNTmEYEzMM4XrhLek?=
 =?us-ascii?Q?ChoVbKXSQcKGBBxnQ9nGjAPVQ7XefOC3e5R8+bymZwiQcP2DLA4zMEOqhsTq?=
 =?us-ascii?Q?HA3jdKnUX4hhkktQaXHG87773AFSF0jnRF+IhpSbNNY5ryfdEZXV/E5N9vhn?=
 =?us-ascii?Q?7yZuia40T18csDrWj5QbwMXFgp6sd8VdWu4Z3nSYWB+AWsZBI4d6ALVectfG?=
 =?us-ascii?Q?TwEawFCp/Cr4eXbXk+43QT6bmF7x8qc5UmuY/iCex96hqB/Q4d+0XzJfFcCn?=
 =?us-ascii?Q?AsW57zW0TQD9WLdB+exfYthOm4I5WjxYJ+Go1KVz2YvLpGzcahSHiM9cmwLB?=
 =?us-ascii?Q?yJQaSC8qGrFUT3RIr0J92Qws2JSSnbmOrGQXlgrl02mt4jluvxKFfi8FW7bE?=
 =?us-ascii?Q?aS91k8UXIPQ65fN6ahzvuVRz9G2k4XTwQ/VVUung6GtZRmdTjkj3JreekajF?=
 =?us-ascii?Q?F8KWl2WF4rcMQwBcjhunuy9w6+GZ7svJp1zMxOOuFpeqcOWx3SpOrlZPmYv+?=
 =?us-ascii?Q?3K/po1aQ/NjCXuNenVGkskedahx1Im7IxnWlcIMtmUAFZHrk13+H+RfKYMot?=
 =?us-ascii?Q?CsrTcHhZ3FsuE73TBfXrU3bbOID5k06ZhTVrC3b+BJI+Rl+E232/IRQz1Alm?=
 =?us-ascii?Q?4JI31sB0YIJ9/WxkJxWJtizChoybQuYJyMoDm2qS3JIFkgBfu+MPTkyB1iwF?=
 =?us-ascii?Q?EFBraUmsYw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	K6XwLlLM+Uk8Nn6dOS71+PAd8f+Uti+ub60TtQieLsEgC62I9BxWhzYRJ3gF/imteMtK4uxU1XVkp0hEr3yG+w0ZYnJAp2mvK9qzgEvVdRFMHdzoEshySo8XesNRO0fihMIokVKvGfPOoFN35QhupEeuWLJoU4hpVC9ss9xFQo7oYtQV+sDDA/SqJ5LIZslWVtfr1Y9fetjmowMvuM1P9r0+F8pUic5Y/Kx41s6sj/x25fbpzJ2pRfyV6ozoMr1Nc1lqIs4VtNwfr8SgZLf9FfqOmUIxbqgfaTPy/lz3dbpSQqPAPrPSqRxQ7KiCxbotgI+WAcKHl8Mvq1x6IYxzCKaB927cvJpF5ySW1BHxWBnianA9NQ0RKXzM4W4qTM10ICud4xXlqqBY8X2g5bqjfrdu13PJ9Ly6pNqXfLZ3aqe2/P0uuvBJhxWajs88gwdphTqD3SnCnNEYP2wVOc7N8gRMi2R4C4cDbXXGooQVuy8uYc8ojxRS05Us3bpvS3/ofy1t0afdeY2SztsOogHDBwzrEPN1h3N/NtgcUco37ey6SSAZI5pBXXkfG2ajlX6ga/sylxhwyDOaGrDOH6U9gtU/malC7t3vQ34OYKeKZhI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81da087e-0a3f-45a1-e6c5-08de40d0b925
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2025 20:37:14.2331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sk5Q97+w3Q5IMaGVARCv9CDfy8dlGw91CDbUWxs6C24i1jdI/RDrfd7PkWuVRf4YwTCu5t+1tce8KVEe/oic0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5148
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 adultscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2512210194
X-Proofpoint-GUID: eNka6vV1o7t6098c3a-0FET_q-vlDkvT
X-Proofpoint-ORIG-GUID: eNka6vV1o7t6098c3a-0FET_q-vlDkvT
X-Authority-Analysis: v=2.4 cv=feqgCkQF c=1 sm=1 tr=0 ts=69485a84 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=CsK451GPy0JZv80on9EA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIxMDE5NCBTYWx0ZWRfX/iM4FJ1eAsAt
 Gnl8uB2KfSptItsV6qX6z1AtTbogsgs5yPuNEwfXqFqdZVSyu48uygIwPhLEFQcWp5PXTT5EP/t
 2ebP+4iiidm1K5NiRz3G9WSgrhgEVZW8HgBvNwqYG11k+5pbQnCEMwL8PQyMBFUEObApz5bPp82
 /SW0Hwao4SiA2v+Rzy6rtK0W/dlK7w+FVJd+6TqytmYjn+cqoTyDXSqCC+IZ6Azx3uv9vPYvq+r
 bRknkU82MvYFNvFw0vOrQLhnkU6CTG0UuNy4j0EmPVNk3cvpyfP7BnhCEi46XSLqZLHq1qRIm1J
 c2IZI64QMy8xdwB3b26dStPZjLDrwQgE0YOJILwkJ5mdXccN73hW3YJsdQcs+B5YAAMqoi2+B4R
 g7E3URPklGL4CHj8tZvTqtm5mZc9mPam7RUxOCQLwpf2YD/Q7Vvah728jN3pkuxWWbh8JKhxjRi
 W81zvmkQFlAgBm+MGbg==

From: Eugene Loh <eugene.loh@oracle.com>

Commit e3f6a4227 ("tracing: Remove pid in task_rename tracing output")
of the Linux kernel (6.14-rc1) removed the pid (first) argument to the
task_rename tracepoint.  The corresponding DTrace sdt probe, therefore,
has one less argument.  Change the test to omit args[3], regardless of
the kernel version.

Change the test to emit more diagnostic output in case of failure.

Commit 564efa04c ("test: adjust sdt.tst.args.d for task_rename
tracepoint differences") of DTrace already handles this task_rename
issue for test/unittest/sdt/tst.args-*.d by simply skipping one test
or the other depending on whether the kernel version is < or >= 6.14.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/disasm/tst.ann-bvar.r  |  1 -
 test/unittest/disasm/tst.ann-bvar.sh | 14 +++++++++++---
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/test/unittest/disasm/tst.ann-bvar.r b/test/unittest/disasm/tst.ann-bvar.r
index a55fb6deb..9ec0d8187 100644
--- a/test/unittest/disasm/tst.ann-bvar.r
+++ b/test/unittest/disasm/tst.ann-bvar.r
@@ -11,7 +11,6 @@
 85 0 1 0000 ffffffff    call dt_bvar_args             ! args[0]
 85 0 1 0000 ffffffff    call dt_bvar_args             ! args[1]
 85 0 1 0000 ffffffff    call dt_bvar_args             ! args[2]
-85 0 1 0000 ffffffff    call dt_bvar_args             ! args[3]
 85 0 1 0000 ffffffff    call dt_bvar_caller           ! caller
 85 0 1 0000 ffffffff    call dt_bvar_curcpu           ! curcpu
 85 0 1 0000 ffffffff    call dt_bvar_curthread        ! curthread
diff --git a/test/unittest/disasm/tst.ann-bvar.sh b/test/unittest/disasm/tst.ann-bvar.sh
index 61e838d10..d7caeecfb 100755
--- a/test/unittest/disasm/tst.ann-bvar.sh
+++ b/test/unittest/disasm/tst.ann-bvar.sh
@@ -1,12 +1,13 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2022, 2026, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
 
 dtrace=$1
+tmpfile=$tmpdir/tst.ann_bvar.$$
 
 $dtrace $dt_flags -Sen '
 sdt:task::task_rename
@@ -24,7 +25,7 @@ sdt:task::task_rename
 	trace(args[0]);
 	trace(args[1]);
 	trace(args[2]);
-	trace(args[3]);
+/*	trace(args[3]); */
 	trace(caller);
 	trace(curcpu);
 	trace(curthread);
@@ -50,6 +51,13 @@ sdt:task::task_rename
 	trace(walltimestamp);
 	exit(0);
 }
-' 2>&1 | gawk '/ call dt_bvar_/ { sub(/^[^:]+: /, ""); print; }'
+' >& $tmpfile
+if [ $? -ne 0 ]; then
+	echo "ERROR: DTrace not successful"
+	cat $tmpfile
+	exit 1
+fi
+
+gawk '/ call dt_bvar_/ { sub(/^[^:]+: /, ""); print; }' $tmpfile
 
 exit $?
-- 
2.47.3

