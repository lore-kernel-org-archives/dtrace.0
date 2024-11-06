Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDE342AB0
	for <dtrace@lists.linux.dev>; Wed,  6 Nov 2024 11:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730892614; cv=fail; b=RJOethXmUn6erGzqDQKpgJTqI/oXmyi8jyWF3xIAB/aIViZltx2s82REu7VFxfd+pHvfZ6Y8QB6Wx7bYfufp8OtIkMn2YRLQXMdqqI9oOK339rMyOdV27QlY9qHoKvsouwSBMdjWJmwEk5bKth5Uc3KmUf+Dxcj1CcMrNRYHlro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730892614; c=relaxed/simple;
	bh=VaDYw0cwoobdzTPfZLVjq82t1wbkxatk7WwxbQwXy30=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WTZIH7YKEtQUgaLnoN1YiPBXWUVfxxEUsAyY4xIBeReDDVHDB42JI/IoS6eEJ0ttSq4hP5V23HFeTgNU8P4Snp8JrvyokCPlULV8QQ5UWyuLTGZZgpi0mfBwaCS6ib2CllIQrqMk3HmggS7hFfYD7makAicZwkqGvZ09g9O14cE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MqSdRMkj; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=MNp5TKSn; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MqSdRMkj";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="MNp5TKSn"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A69Bhx9001671
	for <dtrace@lists.linux.dev>; Wed, 6 Nov 2024 11:30:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=qez8575JJRuTa3QfkIAJZ0jOxk3b0vsYZfjad4YPkwg=; b=
	MqSdRMkjCS0rB0GFZsIscgmsxMKGUNrd5+z0vHI7f0GC2CkGSsdsAAQBp090ZPdC
	4yYwT5I4KSoNxdlsBWY+LJucNPO0zfVmisnM/Y/LNFalrG6o0aHj2YknUpclqffx
	ah5pV4dG0eYjEl1Vv095enF+gLEcKiEElwcNZXLn+FKD2GTCstx3SEgeF+bGUw/t
	Rtuqw2IeCijJCBkkw2HGoPEuk2kuSZyGc7f+WQ9BACxlti/8a8sgjzlaOszu/f73
	QDGiFRhjxLYKQZTSuzM5iz/uNlGBRE8KIaVU5T/gqruAtiC3PNMVoQELrQg+XbMW
	pV6ZeQ7qfZkbAcOQk/wtsg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42nanyym58-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Nov 2024 11:30:10 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A6Au3Bn008396
	for <dtrace@lists.linux.dev>; Wed, 6 Nov 2024 11:30:10 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42nah8dteq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Nov 2024 11:30:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kFB7i+NcPUkJChs0j7V2jdq5txyP8DjMTXp+DbhQSGQR+SY3MD5OZ/n5xB6e/XOSnC1/+j8gfsVT92jCQmTaCJRfFhCWS2mI/J+V+l+JHQ6L0P2ceWlYEPxo/pBkL8Iybpd8BpuUKA9HNEiymq9O4v7s5jbwEmz8drgrdfaF6E3HpklBIAFdGLOlgAWyTsjw3JpI93/GZsJsgh7vy/bdpeQ7EHxNrJK+yj+GzSXncjgLCu08iFg6SMcx3ysQo004pB/lQYFOAH3VsrIHXwouAWOH2/W4wcmPzkhIxRxzwTS1O0r0oDt1Omln8BIPv819eFT47Pl1EK9Fr+7eqVUxWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qez8575JJRuTa3QfkIAJZ0jOxk3b0vsYZfjad4YPkwg=;
 b=vfJiAg8Gswi+3Qtxwg9XXbZnqrwa59EHsDKpxPC5L1yBzQYgAtw8yluwAL2o+iu+vD/zivDFA3nbnjIWQakkyYZZO0wMawy6m6OEvV95Yw4imZPVTfmnFqrgpSI+gHEHZgWeGX5qUhq7tTU2C04ICPOiiYoDSXDvcpP/rNTww1ZrSbAaDJuaFCp3Qd2F/ePLOv4t5Nxx7J6YGdby+Ifk4L6mjodVM80czp5ive4qcW93fT1EEd9ADWI/aWc6ly3HmDmXQ3Y+S7/uMy9kslTm0kQHHgl/luy+dpIOrCRnVAH5pohKqkWCAosMBwGZJITSpSsNyr55ph9pnqvDaLvNNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qez8575JJRuTa3QfkIAJZ0jOxk3b0vsYZfjad4YPkwg=;
 b=MNp5TKSnk5UmQ5LfUL94aBZjIK0CQXFkECkMIwSUl/KClLMcrkH0jdteGi1Ao97qSieZeeaFrbEmnUDHPHGPM3qV8Olig+h7nIXje5rE0+ugl6ecXslwHvGAsp+rY0Jg9Afxk0fnU5l2vi5hqNRo2UzDmB0sWH1AbvTrtXwhtB0=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by MW4PR10MB5837.namprd10.prod.outlook.com (2603:10b6:303:18d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Wed, 6 Nov
 2024 11:30:06 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%5]) with mapi id 15.20.8114.015; Wed, 6 Nov 2024
 11:30:06 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v7 4/6] usdt: typed args and arg mapping
Date: Wed,  6 Nov 2024 11:29:40 +0000
Message-ID: <20241106112942.264351-5-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241106112942.264351-1-nick.alcock@oracle.com>
References: <20241106112942.264351-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0629.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::10) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|MW4PR10MB5837:EE_
X-MS-Office365-Filtering-Correlation-Id: dc88f209-6953-4e74-d0ff-08dcfe565d28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|10070799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WGaUaj/7Rint9oh1XG5UH8ZTzM1Pi90BFFMv5mVI0s9N01kj04NCE792RjWu?=
 =?us-ascii?Q?sXg5Lm2PGmPAg2pMStQuuHtIblwCa0ZjtXtYNUfRYdrC12/Fl3WGhk2eSZCU?=
 =?us-ascii?Q?cpd/AlOIra5kKgziFDsWrEzHKPsVxF7WTSAAylQlWgPwNsDrrHMkz7cVgVAi?=
 =?us-ascii?Q?c+BvS0rycE2Q1sX4XHliCPl80dh4ye7njH3+e8QopuH27fmW4b16irGijhXv?=
 =?us-ascii?Q?ruNmtfAtU/k6zwk7fL0Tgf8QUFrrtSDri7p0RmuD0dZj01DwtATijNcpP9y6?=
 =?us-ascii?Q?3uc+3Ev30Bbmk4BVi/fNq0mv4gfjX1pZwD4y3/iCakhRqw2UGr86LfldOcyx?=
 =?us-ascii?Q?gCqKkheYYWSwk1wt8FnUoHCi80tjb7rF4niUcYGjsOqk0EC5Uzx3F1H8QtSx?=
 =?us-ascii?Q?G1FGMk5/pdHoun8ohRHsDpz3Xxdvt07XhrVKpqUQKC4tXpykAbyISYPHcu1C?=
 =?us-ascii?Q?RYjbQvZBx0kaB2315TKcjE1JjJ0RkOsmqPKjzZk5sEIBWzdKrdQfKcfCRLXI?=
 =?us-ascii?Q?Qo0wtbX+LqR/K4mbJLYv4ET0nvXUjGM4KdwFrMtI6Tzd2IA6UsEex3daYwv2?=
 =?us-ascii?Q?D59XOt/J9B/z/OZL4z69QTlsT6+d9X3zTAk8A7wNIxHZWdM9qyrnxtzqHJCV?=
 =?us-ascii?Q?tzGDVMCm+FNNfKLvEfjpcxEtF6pbgzhT7ckom3T94LCNtfYGibvT3jFbRVwT?=
 =?us-ascii?Q?mbXlt3wTgTGOZVB8oAeg53BBYUGIWodbgGC1SUFkRRPgA9KcXRt2rLyybXL+?=
 =?us-ascii?Q?HCyZ2JTKoDdRNTJ6AVBoRBIkjroif2xl6HMwBxnXFqeBPhh+EfADUsap/0j1?=
 =?us-ascii?Q?IVqGSXO7lsfPl6g4CQEktKKV8zZj8z1DpOhT5JZmBodpVEUBypfY7fG8ljLg?=
 =?us-ascii?Q?o+XFbRNHFAOG8GYfvTzEPpJsFrN7UGmsdg+dYd1m1ih0aZ1Jixw64O/lPr78?=
 =?us-ascii?Q?gET9Q+S0Je0qOtJ48qTOA4eZjhjEx8DAXTfK3dB/bRq5encqXCWyjHZNsW2S?=
 =?us-ascii?Q?lDGX9YJUpl+FnsSqvv1Z+1ZLjBY2GLRaCbZ64b67bgvq4ovClfx+Xmif5KxU?=
 =?us-ascii?Q?ceTiWtrxYG5aSCIFX0UohqplFfTW0s0stHyGgpUQNaLVb4h8JxhF/pK9iGsk?=
 =?us-ascii?Q?I4aRAYa+dmJ/C5SPgCdwnCb+Q2/I0P3ESFhQloACrydRkpUOD1jnaKQxIoPD?=
 =?us-ascii?Q?7cf7rn3trIpn/D2Q1NaLrV3rC7B8wgIqTl9R2MdgdTYb6+ph71CmVd8MSLIt?=
 =?us-ascii?Q?QVYKdb8Qk8pS/9y6NkUO9YsEbNocZ4Rh3Q1EsOibjwk8+H/MKm2SmFIKAMJ2?=
 =?us-ascii?Q?FUVWzT4E9oqS38TZHAvnUhkg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ySBJ7tCIOoqmOcipvONnpcsTV4eViAWhI4axcViubgpjQ89j+nErTUFUGH1B?=
 =?us-ascii?Q?mGLuVzwX1XpCoArEUzuR9x7Hk9NRldUufR3BVBx8lxwEa3zks5w0sLjopchV?=
 =?us-ascii?Q?bmBi9CXNXj0Jky5SB4ciJbwcpXbkK3wMM1IlVAUf3s+XMU6h1s8lE0IVR7bR?=
 =?us-ascii?Q?D/fE9kZNVEnng7jZqKgiP7O8DdQ8/a6KjAKSbONO1G/tVDUoaDVnleBJWjEx?=
 =?us-ascii?Q?Gd/akPy1Sd4bV/ntF3wFOfTLJ7KfYeP7K+Ydnqs9kSsDBw7Vx6LF6N3Wat3S?=
 =?us-ascii?Q?3nNFJ4NQy4iffms6M+l1gnTKTXoYejbd8mBOKAze5kEiUOTZqQbM/l3zF7iX?=
 =?us-ascii?Q?OqMSQfhpLQnt94mrGpL2qkcq6IWaq9PpPQP/6j8oeFMrBx4vYnGhChL2hYAl?=
 =?us-ascii?Q?BIDktcHgq7LsJE4lYumbEmA2015iU9qZDJS7VHeFhzAoG9cnNKB3uLyR2NVJ?=
 =?us-ascii?Q?OCliV1+0wDdk9MIxtEMKYuIu0X/ZdxQ0Pa4E8NHph9psieINgfRhklRBDwSV?=
 =?us-ascii?Q?MiVfXyUHpX+2XW03D+LWSz1zEfApqacSum4XxEqrkAHzWhaYT9DvfUNm4foW?=
 =?us-ascii?Q?d8NWhnPWo72LnNcBkSub0mRnjNnypJLAU2bu4cnOrReLwS3NBk/janEutnLR?=
 =?us-ascii?Q?I8teM2Lq+r4yK0+2aVpm0YcMKx2RYYka8Fd8CfF1rxOvTBCZJA7WyVN8ZJe5?=
 =?us-ascii?Q?wnXuKxd1Zq7d29MbunGODD0R7TRRubzsBsc6hyFt4Z6ctEub5YDkVcE5dWzU?=
 =?us-ascii?Q?JBM+r/hMmB3IRUqqRMZHQ+xW482KHv9Uw/k4drh4ZG9UE3x3QyZUoe0wQ0kG?=
 =?us-ascii?Q?LzPbjN8sZ1W2guKO5qQhDUYhR5CszrJzsDT8oXqPgsK1118lxf3luY6mpapm?=
 =?us-ascii?Q?swFUJpqHe6yInGyCK6bb9kshTjP3DuRbGVRvpavw8tW7t362dBGa5ranndDh?=
 =?us-ascii?Q?m761kF88tGCl1/iUIwNo/x5bHyY4zqHlXMbALy0mDI/44EMf6/DT+TVMmkvo?=
 =?us-ascii?Q?6Gj+etVfMBNa6eTN+gSftAdMG3D2nCQw3yYo0AiLa6picUI5pYbBxqwsP0JW?=
 =?us-ascii?Q?VLc0UMQhZ9JeERK2QT5UjMEVj+ienZp6DLz67gBu2LaCnIQUHiKeGKMSjbTL?=
 =?us-ascii?Q?20m8XsgBnhuMbm+NN/zIBIzvXwsrcSFIcKb1wlCTFf+2ne4E0FCb2obrRIio?=
 =?us-ascii?Q?n2H21V+hKHU70kLEEGVOFas9LSulOG1HZ6hFEn3G6wa/o7dk8zrETq12xt7w?=
 =?us-ascii?Q?SmohOucILJjU6+2BkXyO1Ak8VJVrQp+UXO66v8/hgKz+Z86Vn3H8mpl6MTng?=
 =?us-ascii?Q?PUEZJryTOHNt2cJmF18DpuHuMXDDMQ25v6vpWxwr5pZJfjmAbMFoRYNkrB8v?=
 =?us-ascii?Q?yn51/Ow7FL1pt5liGAVbf/MnaR1sXy636taEoSMBZwjSGMjU2DnJpsFK57K6?=
 =?us-ascii?Q?B2o89BKEXCkZIfpNUnl4SRizqhB0cLLycTaTo+pkLJ9BIgl9cs+eXmVxiorX?=
 =?us-ascii?Q?2OWJt17I5il6Xlph8+7/x+oa43aBq+lF93ZVKEAGBRs2h2oeyGDJRzh3NznK?=
 =?us-ascii?Q?uKVtXX/leGwBVHWZDGpXx+yH01Wb8lonjjsgjJS9YXTehQt52ehQAwEVRfBc?=
 =?us-ascii?Q?FA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8U9nP0cCu8wlXyhA5oshGVY66DWOoOQ7Mj4U3NrEbMKqI2+6Ey1HpVXZDorsPq82HZOuFmZEOP9wBr8GLVHa3w0tuyXwBtposbfJHepumDvoiD02ssot7uKbg9D+3evN2kwCIPNMJ9XXAzLuARcCpa2P2jhZg/ljh9lqq/r+3H6Oa/GRul1v+YQyzQhMKS5B5vQn7QGBl9vE3IXjNKdCLwcc8uzC/AUVlS4TfkpT/NPLY9VofxdX8qBL/JyxXe8d2n6PV3vLN2xGRgw9aZdgJsnpuhYtYTXgDRUj88GDQKlWNdO1OGvBUoABc6J0R8V/NdQVnMj3uXoFAQY/I6O2K7khOjkTwbIF1ROYe7THrMUz9mP65H35F/5tNd+YFnXqVq8Z2Rvcj8ZJJdFGrh7zM6IScF/641hGsrRhzbvq0qmt9neX4VX+qfBk7KBxYK8w+i2zW/Iy49rlcIbRx+IFud5/tRUhXXqIL6gksgLLCyBXwogp+28AL0HnV/p1VZ4B+Mgq2UgxdKbI2iChhxawYo2a2nhwvbXeIGWtLsgOlz1jCfu9aEkgt9bPdtUbk4k6/FOIMjtLWe8yrk0nlblz2dBBvhodbi8ge+WbruH6P5g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc88f209-6953-4e74-d0ff-08dcfe565d28
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 11:30:06.4976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Aco2mYV3l3oYpKC4GQmupZ6fsNGclq+duSikeRb/ui8NXGUJnuIuN1NijP3QzRgoZX4D7zVwVH0yAfs5ot/Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5837
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-06_05,2024-11-06_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0 spamscore=0
 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411060094
X-Proofpoint-ORIG-GUID: EyolCGfxEsGXvF30vrQ1iVgmPJDKiKY2
X-Proofpoint-GUID: EyolCGfxEsGXvF30vrQ1iVgmPJDKiKY2

This change propagates the arg type and mapping info we just got into the
pid_probespec_t onward into the underlying dt_uprobe_t and shuffles the
argument values by calling dt_cg_tramp_map_args().  With this, USDT probes
should now have visible types which obey the :-notation translators
specified in their .d file (this is now tested).

The probe_info hook has been moved from the underlying probe to the
overlying one as part of this: underlying probes don't have any user-visible
args to get info for, and their probe_info functions are never called.  We
populate the dt_argdesc_t in a function ultimately called from USDT probe
discovery via provide_underlying, so it predates trampoline setup let alone
probe_info on the overlying probe and all the args info is present before it
is needed.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 include/dtrace/pid.h                          |   1 +
 libdtrace/dt_pid.c                            |   2 +-
 libdtrace/dt_prov_uprobe.c                    | 184 ++++++++++++++++--
 test/triggers/usdt-tst-argmap-prov.d          |   5 +-
 test/triggers/usdt-tst-argmap.c               |   5 +-
 .../dtrace-util/tst.ListProbesArgsUSDT.r      | 130 +++++++++++++
 .../dtrace-util/tst.ListProbesArgsUSDT.r.p    |   2 +
 .../dtrace-util/tst.ListProbesArgsUSDT.sh     |  89 +++++++++
 test/unittest/usdt/err.argmap-null.d          |  41 ++++
 test/unittest/usdt/err.argmap-null.r          |   2 +
 test/unittest/usdt/err.argmap-null.r.p        |   2 +
 test/unittest/usdt/tst.argmap-null.d          |  32 +++
 test/unittest/usdt/tst.argmap-typed-partial.d |  49 +++++
 test/unittest/usdt/tst.argmap-typed.d         |  48 +++++
 test/unittest/usdt/tst.argmap.d               |   5 +-
 15 files changed, 578 insertions(+), 19 deletions(-)
 create mode 100644 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r
 create mode 100755 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r.p
 create mode 100755 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh
 create mode 100644 test/unittest/usdt/err.argmap-null.d
 create mode 100644 test/unittest/usdt/err.argmap-null.r
 create mode 100755 test/unittest/usdt/err.argmap-null.r.p
 create mode 100644 test/unittest/usdt/tst.argmap-null.d
 create mode 100644 test/unittest/usdt/tst.argmap-typed-partial.d
 create mode 100644 test/unittest/usdt/tst.argmap-typed.d

diff --git a/include/dtrace/pid.h b/include/dtrace/pid.h
index 25bfacfdbfe2..c53e600475df 100644
--- a/include/dtrace/pid.h
+++ b/include/dtrace/pid.h
@@ -22,6 +22,7 @@ typedef enum pid_probetype {
 	DTPPT_ENTRY,
 	DTPPT_RETURN,
 	DTPPT_OFFSETS,
+	DTPPT_USDT,
 	DTPPT_IS_ENABLED
 } pid_probetype_t;
 
diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index 189b15f61a89..a0b3d892fd23 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -1001,7 +1001,7 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, dt_proc_t *dpr,
 				goto oom;
 			}
 
-			psp.pps_type = tp->tracepoint.is_enabled ? DTPPT_IS_ENABLED : DTPPT_OFFSETS;
+			psp.pps_type = tp->tracepoint.is_enabled ? DTPPT_IS_ENABLED : DTPPT_USDT;
 			psp.pps_prv = prv;
 			psp.pps_mod = mod;
 			psp.pps_fun = fun;
diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index a8c1ab2761f0..1a1500c03ecc 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -46,9 +46,11 @@
 /* Provider name for the underlying probes. */
 static const char	prvname[] = "uprobe";
 
-#define PP_IS_RETURN	1
-#define PP_IS_FUNCALL	2
-#define PP_IS_ENABLED	4
+#define PP_IS_RETURN	0x1
+#define PP_IS_FUNCALL	0x2
+#define PP_IS_ENABLED	0x4
+#define PP_IS_USDT	0x8
+#define PP_IS_MAPPED	0x10
 
 typedef struct dt_uprobe {
 	dev_t		dev;
@@ -57,7 +59,10 @@ typedef struct dt_uprobe {
 	uint64_t	off;
 	int		flags;
 	tp_probe_t	*tp;
-	dt_list_t	probes;		/* pid/USDT probes triggered by it */
+	int		argc;		   /* number of args */
+	dt_argdesc_t	*args;		   /* args array (points into argvbuf) */
+	char		*argvbuf;	   /* arg strtab */
+	dt_list_t	probes;		   /* pid/USDT probes triggered by it */
 } dt_uprobe_t;
 
 typedef struct list_probe {
@@ -123,6 +128,8 @@ static void probe_destroy_underlying(dtrace_hdl_t *dtp, void *datap)
 	dt_tp_destroy(dtp, tpp);
 	free_probe_list(dtp, dt_list_next(&upp->probes));
 	dt_free(dtp, upp->fn);
+	dt_free(dtp, upp->args);
+	dt_free(dtp, upp->argvbuf);
 	dt_free(dtp, upp);
 }
 
@@ -516,6 +523,80 @@ static int discover(dtrace_hdl_t *dtp)
 	return 0;
 }
 
+/*
+ * Populate args for an underlying probe for use by the overlying USDT probe.
+ * The overlying probe does not exist yet at this point, so the arg data is
+ * stored in the underlying probe instead and will be accessed when probe_info
+ * is called in the overlying probe.
+ *
+ * Move it into dt_argdesc_t's for use later on. The char *'s in that structure
+ * are pointers into the argvbuf array, which is a straight concatenated copy of
+ * the nargv/xargv in the pid_probespec_t.
+ */
+static int populate_args(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
+			 dt_uprobe_t *upp)
+{
+	char	**nargv = NULL;
+	char	*nptr = NULL, *xptr = NULL;
+	size_t	i;
+
+	upp->argc = psp->pps_xargc;
+
+	/*
+	 * If we have a nonzero number of args, we always have at least one narg
+	 * and at least one xarg.  Double-check to be sure.  (These are not
+	 * populated, and thus left 0/NULL, for non-USDT probes.)
+	 */
+	if (upp->argc == 0 || psp->pps_xargv == NULL || psp->pps_nargv == NULL
+		|| psp->pps_xargvlen == 0 || psp->pps_nargvlen == 0)
+		return 0;
+
+	upp->argvbuf = dt_alloc(dtp, psp->pps_xargvlen + psp->pps_nargvlen);
+	if(upp->argvbuf == NULL)
+		return -1;
+	memcpy(upp->argvbuf, psp->pps_xargv, psp->pps_xargvlen);
+	xptr = upp->argvbuf;
+
+	memcpy(upp->argvbuf + psp->pps_xargvlen, psp->pps_nargv, psp->pps_nargvlen);
+	nptr = upp->argvbuf + psp->pps_xargvlen;
+
+	upp->args = dt_calloc(dtp, upp->argc, sizeof(dt_argdesc_t));
+	if (upp->args == NULL)
+		return -1;
+
+	/*
+	 * Construct an array to allow accessing native args by index.
+	 */
+	if ((nargv = dt_calloc(dtp, psp->pps_nargc, sizeof (char *))) == NULL)
+		goto fail;
+
+	for (i = 0; i < psp->pps_nargc; i++, nptr += strlen(nptr) + 1)
+		nargv[i] = nptr;
+
+	/*
+	 * Fill up the upp->args array based on xargs.  If this indicates that
+	 * mapping is needed, note as much.
+	 */
+	for (i = 0; i < upp->argc; i++, xptr += strlen(xptr) + 1) {
+		int map_arg = psp->pps_argmap[i];
+
+		upp->args[i].native = nargv[map_arg];
+		upp->args[i].xlate = xptr;
+		upp->args[i].mapping = map_arg;
+		upp->args[i].flags = 0;
+
+                if (i != map_arg)
+			upp->flags |= PP_IS_MAPPED;
+	}
+
+	free(nargv);
+	return 0;
+
+ fail:
+	free(nargv);
+	return -1;
+}
+
 /*
  * Look up or create an underlying (real) probe, corresponding directly to a
  * uprobe.  Since multiple pid and USDT probes may all map onto the same
@@ -530,7 +611,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 	char			prb[DTRACE_NAMELEN];
 	dtrace_probedesc_t	pd;
 	dt_probe_t		*uprp;
-	dt_uprobe_t		*upp;
+	dt_uprobe_t		*upp = NULL;
 
 	/*
 	 * The underlying probes (uprobes) represent the tracepoints that pid
@@ -555,6 +636,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 	case DTPPT_IS_ENABLED:
 	case DTPPT_ENTRY:
 	case DTPPT_OFFSETS:
+	case DTPPT_USDT:
 		snprintf(prb, sizeof(prb), "%lx", psp->pps_off);
 		break;
 	default:
@@ -568,6 +650,8 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 	pd.fun = psp->pps_fun;
 	pd.prb = prb;
 
+	dt_dprintf("Providing underlying probe %s:%s:%s:%s @ %lx\n", psp->pps_prv,
+		   psp->pps_mod, psp->pps_fn, psp->pps_prb, psp->pps_off);
 	uprp = dt_probe_lookup(dtp, &pd);
 	if (uprp == NULL) {
 		dt_provider_t	*pvp;
@@ -591,12 +675,24 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 			goto fail;
 
 		uprp = dt_probe_insert(dtp, pvp, pd.prv, pd.mod, pd.fun, pd.prb,
-				      upp);
+				       upp);
 		if (uprp == NULL)
 			goto fail;
 	} else
 		upp = uprp->prv_data;
 
+	/*
+	 * Only one USDT probe can correspond to each underlying probe.
+	 */
+	if (psp->pps_type == DTPPT_USDT && upp->flags == PP_IS_USDT) {
+		dt_dprintf("Found overlapping USDT probe at %lx/%lx/%lx/%s\n",
+			   upp->dev, upp->inum, upp->off, upp->fn);
+		goto fail;
+	}
+
+	if (populate_args(dtp, psp, upp) < 0)
+		goto fail;
+
 	switch (psp->pps_type) {
 	case DTPPT_RETURN:
 	    upp->flags |= PP_IS_RETURN;
@@ -604,15 +700,20 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 	case DTPPT_IS_ENABLED:
 	    upp->flags |= PP_IS_ENABLED;
 	    break;
+	case DTPPT_USDT:
+	    upp->flags |= PP_IS_USDT;
+	    break;
 	default: ;
 	    /*
 	     * No flags needed for other types.
 	     */
 	}
 
-	return uprp;
+        return uprp;
 
 fail:
+	dt_dprintf("Failed to instantiate %s:%s:%s:%s\n", psp->pps_prv,
+		   psp->pps_mod, psp->pps_fn, psp->pps_prb);
 	probe_destroy(dtp, upp);
 	return NULL;
 }
@@ -732,7 +833,7 @@ static int provide_pid_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp)
 
 static int provide_usdt_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp)
 {
-	if (psp->pps_type != DTPPT_OFFSETS &&
+	if (psp->pps_type != DTPPT_USDT &&
 	    psp->pps_type != DTPPT_IS_ENABLED) {
 		dt_dprintf("pid: unknown USDT probe type %i\n", psp->pps_type);
 		return -1;
@@ -786,7 +887,13 @@ static void enable_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
  *	int dt_uprobe(dt_pt_regs *regs)
  *
  * The trampoline will first populate a dt_dctx_t struct.  It will then emulate
- * the firing of all dependent pid* probes and their clauses.
+ * the firing of all dependent pid* and USDT probes and their clauses, or (in
+ * the case of is-enabled probes), do the necessary copying (is-enabled probes
+ * have no associated clauses and their behaviour is hardwired).
+ *
+ * Trampolines associated with USDT probes will also arrange for argument
+ * shuffling before the USDT clauses are invoked if the argmap array calls for
+ * it.
  */
 static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 {
@@ -864,7 +971,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	}
 
 	/*
-	 * USDT
+	 * USDT.
 	 */
 
 	/* In some cases, we know there are no USDT probes. */  // FIXME: add more checks
@@ -873,6 +980,16 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 
 	dt_cg_tramp_copy_args_from_regs(pcb, 0);
 
+	/*
+	 * Apply arg mappings, if needed.
+	 */
+	if (upp->flags & PP_IS_MAPPED) {
+
+		/* dt_cg_tramp_map_args() works from the saved args. */
+		dt_cg_tramp_save_args(pcb);
+		dt_cg_tramp_map_args(pcb, upp->args, upp->argc);
+	}
+
 	/*
 	 * Retrieve the PID of the process that caused the probe to fire.
 	 */
@@ -1083,10 +1200,51 @@ attach_bpf:
 static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 		      int *argcp, dt_argdesc_t **argvp)
 {
-	*argcp = 0;			/* no known arguments */
-	*argvp = NULL;
+	size_t		i = 0;
+	list_probe_t	*pup = prp->prv_data;
+	dt_uprobe_t	*upp;
+	size_t		argc = 0;
+	dt_argdesc_t	*argv = NULL;
+
+	/* No underlying probes?  No args.  */
+	if (!pup)
+		goto done;
+
+	upp = pup->probe->prv_data;
+	if (!upp || upp->args == NULL)
+		goto done;
+
+	argc = upp->argc;
+	argv = dt_calloc(dtp, argc, sizeof(dt_argdesc_t));
+	if (argv == NULL)
+		return dt_set_errno(dtp, EDT_NOMEM);
+
+	for (i = 0; i < argc; i++) {
+		argv[i].native = strdup(upp->args[i].native);
+		if (upp->args[i].xlate)
+			argv[i].xlate = strdup(upp->args[i].xlate);
+		argv[i].mapping = i;
+
+		if (argv[i].native == NULL ||
+		    (upp->args[i].xlate != NULL && argv[i].xlate == NULL))
+			goto oom;
+	}
+
+done:
+	*argcp = argc;
+	*argvp = argv;
 
 	return 0;
+ oom:
+	size_t j;
+
+	for (j = 0; j <= i; j++) {
+		free((char *) argv[i].native);
+		free((char *) argv[i].xlate);
+	}
+
+        dt_free(dtp, argv);
+	return dt_set_errno(dtp, EDT_NOMEM);
 }
 
 /*
@@ -1152,7 +1310,6 @@ dt_provimpl_t	dt_uprobe = {
 	.load_prog	= &dt_bpf_prog_load,
 	.trampoline	= &trampoline,
 	.attach		= &attach,
-	.probe_info	= &probe_info,
 	.detach		= &detach,
 	.probe_destroy	= &probe_destroy_underlying,
 	.add_probe	= &add_probe_uprobe,
@@ -1178,6 +1335,7 @@ dt_provimpl_t	dt_usdt = {
 	.populate	= &populate_usdt,
 	.provide_probe	= &provide_usdt_probe,
 	.enable		= &enable_usdt,
+	.probe_info	= &probe_info,
 	.probe_destroy	= &probe_destroy,
 	.discover	= &discover,
 	.add_probe	= &add_probe_usdt,
diff --git a/test/triggers/usdt-tst-argmap-prov.d b/test/triggers/usdt-tst-argmap-prov.d
index 28134baa6fa3..d8c3e88c4616 100644
--- a/test/triggers/usdt-tst-argmap-prov.d
+++ b/test/triggers/usdt-tst-argmap-prov.d
@@ -1,10 +1,13 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
 
 provider test_prov {
 	probe place(int i, int j) : (int j, int i, int i, int j);
+	probe place2(int i, char *j) : (char *j, int i, int i, char *j);
+	probe place3(int i, char *j) : (char *j);
+	probe place4(int i, char *j) : ();
 };
diff --git a/test/triggers/usdt-tst-argmap.c b/test/triggers/usdt-tst-argmap.c
index 89a0a53fc1d5..9244092514ff 100644
--- a/test/triggers/usdt-tst-argmap.c
+++ b/test/triggers/usdt-tst-argmap.c
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -12,6 +12,9 @@ main(int argc, char **argv)
 {
 	for (;;) {
 		DTRACE_PROBE2(test_prov, place, 10, 4);
+		DTRACE_PROBE(test_prov, place2, 255, "foo");
+		DTRACE_PROBE(test_prov, place3, 126, "bar");
+		DTRACE_PROBE(test_prov, place4, 204, "baz");
 	}
 
 	return 0;
diff --git a/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r
new file mode 100644
index 000000000000..d2e280e5f21c
--- /dev/null
+++ b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r
@@ -0,0 +1,130 @@
+   ID   PROVIDER            MODULE                          FUNCTION NAME
+ XX test_provXXXX              test                              main go_vanishing
+
+	Probe Description Attributes
+		Identifier Names: Private
+		Data Semantics:   Private
+		Dependency Class: Unknown
+
+	Argument Attributes
+		Identifier Names: Private
+		Data Semantics:   Private
+		Dependency Class: Unknown
+
+	Argument Types
+		None
+
+ XX test_provXXXX              test                              main go_halved
+
+	Probe Description Attributes
+		Identifier Names: Private
+		Data Semantics:   Private
+		Dependency Class: Unknown
+
+	Argument Attributes
+		Identifier Names: Private
+		Data Semantics:   Private
+		Dependency Class: Unknown
+
+	Argument Types
+		args[0]: char *
+
+ XX test_provXXXX              test                              main go_doubled
+
+	Probe Description Attributes
+		Identifier Names: Private
+		Data Semantics:   Private
+		Dependency Class: Unknown
+
+	Argument Attributes
+		Identifier Names: Private
+		Data Semantics:   Private
+		Dependency Class: Unknown
+
+	Argument Types
+		args[0]: char *
+		args[1]: int
+		args[2]: int
+		args[3]: char *
+
+ XX test_provXXXX              test                              main go
+
+	Probe Description Attributes
+		Identifier Names: Private
+		Data Semantics:   Private
+		Dependency Class: Unknown
+
+	Argument Attributes
+		Identifier Names: Private
+		Data Semantics:   Private
+		Dependency Class: Unknown
+
+	Argument Types
+		args[0]: char *
+		args[1]: int
+
+   ID   PROVIDER            MODULE                          FUNCTION NAME
+ XX test_provXXXX              test                              main go_vanishing
+
+	Probe Description Attributes
+		Identifier Names: Private
+		Data Semantics:   Private
+		Dependency Class: Unknown
+
+	Argument Attributes
+		Identifier Names: Private
+		Data Semantics:   Private
+		Dependency Class: Unknown
+
+	Argument Types
+		None
+
+ XX test_provXXXX              test                              main go_halved
+
+	Probe Description Attributes
+		Identifier Names: Private
+		Data Semantics:   Private
+		Dependency Class: Unknown
+
+	Argument Attributes
+		Identifier Names: Private
+		Data Semantics:   Private
+		Dependency Class: Unknown
+
+	Argument Types
+		args[0]: char *
+
+ XX test_provXXXX              test                              main go_doubled
+
+	Probe Description Attributes
+		Identifier Names: Private
+		Data Semantics:   Private
+		Dependency Class: Unknown
+
+	Argument Attributes
+		Identifier Names: Private
+		Data Semantics:   Private
+		Dependency Class: Unknown
+
+	Argument Types
+		args[0]: char *
+		args[1]: int
+		args[2]: int
+		args[3]: char *
+
+ XX test_provXXXX              test                              main go
+
+	Probe Description Attributes
+		Identifier Names: Private
+		Data Semantics:   Private
+		Dependency Class: Unknown
+
+	Argument Attributes
+		Identifier Names: Private
+		Data Semantics:   Private
+		Dependency Class: Unknown
+
+	Argument Types
+		args[0]: char *
+		args[1]: int
+
diff --git a/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r.p b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r.p
new file mode 100755
index 000000000000..c575983adf65
--- /dev/null
+++ b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r.p
@@ -0,0 +1,2 @@
+#!/bin/sed -rf
+s,test_prov[0-9]*,test_provXXXX,g; s,^ *[0-9]+, XX,g;
diff --git a/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh
new file mode 100755
index 000000000000..b0a2345a6681
--- /dev/null
+++ b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh
@@ -0,0 +1,89 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2013, 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
+##
+#
+# ASSERTION:
+# Testing -lvn option with USDT probes with a valid probe name.
+#
+# SECTION: dtrace Utility/-ln Option
+#
+##
+
+if [ $# != 1 ]; then
+	echo expected one argument: '<'dtrace-path'>'
+	exit 2
+fi
+
+dtrace=$1
+CC=/usr/bin/gcc
+CFLAGS=
+
+DIRNAME="$tmpdir/list-probes-args-usdt.$$.$RANDOM"
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+cat > prov.d <<EOF
+provider test_prov {
+	probe go(int a, char *b) : (char *b, int a);
+	probe go_doubled(int a, char *b) : (char *b, int a, int a, char *b);
+	probe go_halved(int a, char *b) : (char *b);
+	probe go_vanishing(int a, char *b) : ();
+};
+EOF
+
+$dtrace -h -s prov.d
+if [ $? -ne 0 ]; then
+	echo "failed to generate header file" >& 2
+	exit 1
+fi
+
+cat > test.c <<EOF
+#include <sys/types.h>
+#include "prov.h"
+
+int
+main(int argc, char **argv)
+{
+	TEST_PROV_GO(666, "foo");
+	TEST_PROV_GO_DOUBLED(666, "foo");
+	TEST_PROV_GO_HALVED(666, "foo");
+	TEST_PROV_GO_VANISHING(666, "foo");
+	sleep(10);
+}
+EOF
+
+${CC} ${CFLAGS} -c test.c
+if [ $? -ne 0 ]; then
+	echo "failed to compile test.c" >& 2
+	exit 1
+fi
+$dtrace -G -s prov.d test.o
+if [ $? -ne 0 ]; then
+	echo "failed to create DOF" >& 2
+	exit 1
+fi
+${CC} ${CFLAGS} -o test test.o prov.o
+if [ $? -ne 0 ]; then
+	echo "failed to link final executable" >& 2
+	exit 1
+fi
+
+script()
+{
+	$dtrace -c ./test -lvn 'test_prov$target:::go*'
+	./test &
+	PID=$!
+	disown %+
+	$dtrace -p $PID -lvn 'test_prov$target:::go*'
+	kill -9 $PID
+}
+
+script
+status=$?
+
+exit $status
diff --git a/test/unittest/usdt/err.argmap-null.d b/test/unittest/usdt/err.argmap-null.d
new file mode 100644
index 000000000000..ba765bea7a04
--- /dev/null
+++ b/test/unittest/usdt/err.argmap-null.d
@@ -0,0 +1,41 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/* @@trigger: usdt-tst-argmap */
+/* @@trigger-timing: before */
+/* @@runtest-opts: $_pid */
+
+/*
+ * ASSERTION: Verify that a probe left with no args at all due to mapping
+ *            has no args.
+ */
+
+BEGIN
+{
+	/* Timeout after 5 seconds */
+	timeout = timestamp + 5000000000;
+}
+
+test_prov$1:::place4
+/args[0] != 204 || args[0] == 204/
+{
+	printf("this should never happen");
+	exit(1);
+}
+
+test_prov$1:::place4
+{
+	printf("nor should this");
+	exit(1);
+}
+
+profile:::tick-1
+/timestamp > timeout/
+{
+	trace("test timed out");
+	exit(1);
+}
diff --git a/test/unittest/usdt/err.argmap-null.r b/test/unittest/usdt/err.argmap-null.r
new file mode 100644
index 000000000000..215475e39b48
--- /dev/null
+++ b/test/unittest/usdt/err.argmap-null.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/usdt/err.argmap-null.d: line 24: index 0 is out of range for test_provXXXX:::place4 args[ ]
diff --git a/test/unittest/usdt/err.argmap-null.r.p b/test/unittest/usdt/err.argmap-null.r.p
new file mode 100755
index 000000000000..c575983adf65
--- /dev/null
+++ b/test/unittest/usdt/err.argmap-null.r.p
@@ -0,0 +1,2 @@
+#!/bin/sed -rf
+s,test_prov[0-9]*,test_provXXXX,g; s,^ *[0-9]+, XX,g;
diff --git a/test/unittest/usdt/tst.argmap-null.d b/test/unittest/usdt/tst.argmap-null.d
new file mode 100644
index 000000000000..dacf4c4f569a
--- /dev/null
+++ b/test/unittest/usdt/tst.argmap-null.d
@@ -0,0 +1,32 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/* @@trigger: usdt-tst-argmap */
+/* @@trigger-timing: before */
+/* @@runtest-opts: $_pid */
+
+/*
+ * ASSERTION: Verify that you can map to no args at all.
+ */
+
+BEGIN
+{
+	/* Timeout after 5 seconds */
+	timeout = timestamp + 5000000000;
+}
+
+test_prov$1:::place4
+{
+	exit(0);
+}
+
+profile:::tick-1
+/timestamp > timeout/
+{
+	trace("test timed out");
+	exit(1);
+}
diff --git a/test/unittest/usdt/tst.argmap-typed-partial.d b/test/unittest/usdt/tst.argmap-typed-partial.d
new file mode 100644
index 000000000000..8c4d7273c0ab
--- /dev/null
+++ b/test/unittest/usdt/tst.argmap-typed-partial.d
@@ -0,0 +1,49 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2007, 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/* @@trigger: usdt-tst-argmap */
+/* @@trigger-timing: before */
+/* @@runtest-opts: $_pid */
+
+/*
+ * ASSERTION: Verify that args[N] variables are properly typed when mapped,
+ *            even if some args are unused.
+ */
+
+BEGIN
+{
+	/* Timeout after 5 seconds */
+	timeout = timestamp + 5000000000;
+}
+
+test_prov$1:::place3
+/stringof(args[0]) != "bar"/
+{
+	printf("arg is %s; should be \"bar\"",
+	    stringof(args[0]));
+	exit(1);
+}
+
+test_prov$1:::place3
+/stringof(copyinstr(arg0)) != "bar"/
+{
+	printf("arg is %s; should be \"bar\"",
+	    stringof(copyinstr(arg0)));
+	exit(1);
+}
+
+test_prov$1:::place3
+{
+	exit(0);
+}
+
+profile:::tick-1
+/timestamp > timeout/
+{
+	trace("test timed out");
+	exit(1);
+}
diff --git a/test/unittest/usdt/tst.argmap-typed.d b/test/unittest/usdt/tst.argmap-typed.d
new file mode 100644
index 000000000000..1243e059b8ae
--- /dev/null
+++ b/test/unittest/usdt/tst.argmap-typed.d
@@ -0,0 +1,48 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2007, 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/* @@trigger: usdt-tst-argmap */
+/* @@trigger-timing: before */
+/* @@runtest-opts: $_pid */
+
+/*
+ * ASSERTION: Verify that args[N] variables are properly typed when mapped.
+ */
+
+BEGIN
+{
+	/* Timeout after 5 seconds */
+	timeout = timestamp + 5000000000;
+}
+
+test_prov$1:::place2
+/stringof(args[0]) != "foo" || args[1] != 255 || args[2] != 255 || stringof(args[3]) != "foo"/
+{
+	printf("args are %s, %d, %d, %s; should be \"foo\", 255, 255, \"foo\"",
+	    stringof(args[0]), args[1], args[2], stringof(args[3]));
+	exit(1);
+}
+
+test_prov$1:::place2
+/stringof(copyinstr(arg0)) != "foo" || arg1 != 255 || arg2 != 255 || stringof(copyinstr(arg3)) != "foo"/
+{
+	printf("args are %s, %d, %d, %s; should be \"foo\", 255, 255, \"foo\"",
+	    stringof(copyinstr(arg0)), arg1, arg2, stringof(copyinstr(arg3)));
+	exit(1);
+}
+
+test_prov$1:::place2
+{
+	exit(0);
+}
+
+profile:::tick-1
+/timestamp > timeout/
+{
+	trace("test timed out");
+	exit(1);
+}
diff --git a/test/unittest/usdt/tst.argmap.d b/test/unittest/usdt/tst.argmap.d
index 7896dc07e0e2..a7d68da3dfbc 100644
--- a/test/unittest/usdt/tst.argmap.d
+++ b/test/unittest/usdt/tst.argmap.d
@@ -1,17 +1,16 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2007, 2020, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2007, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
 
-/* @@xfail: dtv2 */
 /* @@trigger: usdt-tst-argmap */
 /* @@trigger-timing: before */
 /* @@runtest-opts: $_pid */
 
 /*
- * ASSERTION: Verify that argN and args[N] variables are properly remapped.
+ * ASSERTION: Verify that argN and args[N] variables are properly mapped.
  */
 
 BEGIN
-- 
2.46.0.278.g36e3a12567

