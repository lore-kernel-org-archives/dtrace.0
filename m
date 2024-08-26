Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58A7146D5A
	for <dtrace@lists.linux.dev>; Mon, 26 Aug 2024 14:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724682618; cv=fail; b=KrJ4HJiS1RkCHjY+TcMs6TWJ7cyCMZxMKxbeMfauJZCclQtOFCmoyzPRnRNPtJ1uwTwjnMU1WYZBuiF82vHj4McYiUl+MDoeEAhXGGXm5EbZ1ittLfhrZnnkCc/aWVTgH1fZrRotI+1M5mMzUvqdn3MecZataeXpUSNLhfw5ef4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724682618; c=relaxed/simple;
	bh=7CDMgi7tHYLVeNgV7CMEArudwCjiRwOdBax9hH8+LcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mjtJInWNE4aVsbIKp+qy8hQVm8XiXQxJKWRSuHsJJ3uafUN5H69TGTePT6Zs4GxbrjQfTYDOCHgJr6RHdN3u5ICmB/+uPDS8j+s5Q+Pu84qNTRsxKm+SRuqI0w9tT/hvNAVLxItgP+p4LWateZMQotNj0uOqELlF5nU9HGYnNkE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZEiS3K6L; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=hHFEUW4D; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZEiS3K6L";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="hHFEUW4D"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47QE2YxF016139
	for <dtrace@lists.linux.dev>; Mon, 26 Aug 2024 14:30:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=wM8RG3exIKnrcLH
	CMckYCCnPsylZzXh3tYMCuFtys8s=; b=ZEiS3K6LCGCbHH2t65i8RPIq7uXhQTA
	mSlRXnWIz2RCXdzT5WYrOHNvp0pcWYvYsn+AQRaJXCy8iaRzSsK0JMyL1mduAb7q
	AWUI0gGBpJ+4LaMTeaZH+TOgABDE5E6MOisARmTHIfRalbt0tYDf2/W1yk1I812r
	bA1/KPSY6l1MAHch9TwgOBXePs+ysVXB5FBtqN7JN5V5wtKjAK2fnYJY0vGqtM4p
	4pOLI6YmDOlQ+gQPz+ffwcFffuL5aLyiuSvLRpBjKjkDwRQeSaeLxC5r1/SaxwCZ
	lma4PtT2Jlm0QcQzKiu06L0DSyyw4MgXp+2Uk8cN5pdkiKzSVW/6s8Q==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4177u6kaak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 26 Aug 2024 14:30:13 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47QD1CQf010461
	for <dtrace@lists.linux.dev>; Mon, 26 Aug 2024 14:30:13 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2040.outbound.protection.outlook.com [104.47.73.40])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41894kkygc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 26 Aug 2024 14:30:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eaSKc56mlvVP4BxmdlpIdt4H/X4d7dvDwiww95fDWvZ3mG7yx03FSDdIavQF6JAmZ2c8x5luiICBkBH46xoF/1w+O90TZsFgkp4F4TNVA6cQ/GWUmcme/mHJCklTitha3tyfhYuIlMLVqXT5uTFyDz2WXE8EL9rImOFFD9FnsoYB/hI44JTLgqqJsOj2ufLbKgnplRTYD2jVxh5/jLx4vpgLxkJ3xEfBtCzStVOonYO3fv18dbVngskaaU6meHK8tB8/fPOR7fOV3bgTVcelOdCGelXl2KEYVBJBbOuRipIB5bj/QV7dfERJ/KLlBD9KJNgnbbxnkJhGz7NnuXNHNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wM8RG3exIKnrcLHCMckYCCnPsylZzXh3tYMCuFtys8s=;
 b=pC1KIlFdpXVsXW17TCta7ZvXwSSibT1jzDcruOhbfwXw8rLtRNAftZZDTEFss0k0yvD9V4zAjtdyHpNBR0mP8DUZ2Ipo0ZjoTE9ysTNyLoRLoKV3hQhQmSrhcYekVx/tQBL6Yl6ixO70YNhyr5BRHfb6McI4Z2td9JGstPq61RjjaSZIUOOuxHv7VW+Ea2RmuEYs/BOPwGjBGfNXOihsG2++Roru4G7kd2hnDZ8woaAiJ2bTSk4d7mu5FrVDt7wfX7Rv0XfZYAPZtrrr649NeYBcMuTttIPoWR/IQWWlG/8QtltHxO9O46vpvHRvO1fZa9B5bVGK+jhnDZPfQC9nYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wM8RG3exIKnrcLHCMckYCCnPsylZzXh3tYMCuFtys8s=;
 b=hHFEUW4D9rldifMXwPVibXLmwH/AQuLs/NeWW9RtaSiWCyRewFdE2BSXKJyQqAxMm9OBySKYkmfwFmYMI7/wsVOiCiEJI44MEFObhI0651SjWa4WdUM5SXoZFR25f5SxzRw5kB27LHA2/0Fy5mR2XxXtzp6e3/mpb5rZWM8tphg=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by SN7PR10MB6381.namprd10.prod.outlook.com (2603:10b6:806:26f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.14; Mon, 26 Aug
 2024 14:30:08 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%5]) with mapi id 15.20.7918.012; Mon, 26 Aug 2024
 14:30:08 +0000
Date: Mon, 26 Aug 2024 10:30:06 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 31/38] Fix dt_pebs_init() call
Message-ID: <ZsyRbgnYtFelMhM8@oracle.com>
References: <20240627053904.21996-1-eugene.loh@oracle.com>
 <20240627053904.21996-12-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627053904.21996-12-eugene.loh@oracle.com>
X-ClientProxiedBy: BL0PR02CA0028.namprd02.prod.outlook.com
 (2603:10b6:207:3c::41) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|SN7PR10MB6381:EE_
X-MS-Office365-Filtering-Correlation-Id: 824a589e-6057-4f1d-8839-08dcc5db95bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Bt5ld6DWhsGWWKU5ZcFS00/jyMZRkDUKVB/n1ZfRmhSuA3zsyAE29AMAvrUF?=
 =?us-ascii?Q?L2JGxToPzgLuxgpmJZz362iB8jQgM9TveBTE3prf079S1WWktqXIK+NB3n0W?=
 =?us-ascii?Q?ST/nrIfgkJXW2mL8h/ORgJHMePi91N5POZaPNwE8o9YNtve6kTTsjrZPLRYA?=
 =?us-ascii?Q?tvreM6aCwzFjOw54WrgEbuWo5PBdwpRTm8jzPswCWQWYvMmbHGEbnKGp+BFk?=
 =?us-ascii?Q?lbvy0aRbrrjgxtNzKCpaOxEWci9YBYtm9ntltOY7jxeopQxSVhxBFNmlKHcQ?=
 =?us-ascii?Q?uTr1mW0MASbmzjswwCfbI82uK+DLfNcCrX+Vmzt135mhif6e2rAlqiG4vFJk?=
 =?us-ascii?Q?gnMsrlhSF3/pGu38hNPfu/aPzXRgTTflYEekn057rtsYO91di+C4qmTrSgU/?=
 =?us-ascii?Q?AipYST9WE5bUTC7osjfuSBROdaK3QYTt/VRgULdOrhvdVmVww7u7HtFm8aF6?=
 =?us-ascii?Q?UT4ucsPRY8NVN1sy92PT0paYGqWkgO2YbZk+QWteMP2WJDvnJ3SUMHN3yFuK?=
 =?us-ascii?Q?U36BC8ey0eASwqlKfwQIz/rkuEzvolARjyL0Vi1qIfFjC3JJyfTjIe+8e7l/?=
 =?us-ascii?Q?rB9gqUkfALDF2sltHwP9oE25mLyhO6UwcT4Uz19fRPKGoHt5D15rbQZH89W5?=
 =?us-ascii?Q?kXqXzPc12KoNGe6xok0cXfPV2mKTtGTUQS6djjkivkHd70lXiQ7h4DZi7+YZ?=
 =?us-ascii?Q?9Ybm3ElP0ehj9Cdc+G0Rz7kgzh+nZakGO/PCuXkT5A57ZG3KPQ2JhqKw0tBu?=
 =?us-ascii?Q?7xe3DOcu4cA+STJVtZXsJk3Ntz47KPogY7kASQsbZpN+xpHXXN5ELKjcR4Tj?=
 =?us-ascii?Q?rGxSg3BFBYCVpGEGDpzaZdnaDBxYi+Xsy7henkcGIzoLyCf4+KGUGUT+aG3i?=
 =?us-ascii?Q?+ZmhcBBd2Q8fCfGbxXIPp6B1dN4Q0IsHh4wepdJarSWOqC/eRH6h4yO8wGji?=
 =?us-ascii?Q?yGO1fDTQkX8l9DebYCVGmB3W9CMpY0hJ7rztzeGBB0M0p//SWmGzqXOT+WfE?=
 =?us-ascii?Q?gkcnMgHtqiTPxyNXy1jdX65jDGHtD4NilBlNURVDl8c4cHTGo58zHtiTBwnK?=
 =?us-ascii?Q?0cFZJ7rOOTHJYJEopXw3HRvTq5+bPW8FMTycJzZ+IZm0ABR2uguA4sn3MS+K?=
 =?us-ascii?Q?Hod21gJyk5IW6IIa1QbZMPAc26M0Tnx5cnmU2S2j/hgXlCbAeSpCQmFsrlCn?=
 =?us-ascii?Q?UgreuOzTP0Qm9jGOugLTWK4GxqsD0FH2K35tjREgMVHgcyUoJGg/njiH7f3A?=
 =?us-ascii?Q?s+G1FdGhRya/5D9UEJy6Wgaoyac7+NFRXFIMUvJj6HsKQkYhFozyxw0saw2b?=
 =?us-ascii?Q?7Lw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?H9IjQyl1V5uutLgjX+KltuuSxXJo+NgliezW9u8IwqsYibS+RehJHlMaI5o+?=
 =?us-ascii?Q?Xh0Vk7W7fM+Ncq9/UryV2ertoL5s628zKqyEMKQiWm8ncq8jwh31WeS6zzsW?=
 =?us-ascii?Q?WutZMBRqviXHtjDGsrF+qNxE1EdDiogu0edI6P4F3WsEPIWL/xSTp54GDDys?=
 =?us-ascii?Q?lmegS1QxB3OiHdk0UrL4scl8SNbEsdObl9/JTERFBTOFuV67+ZZvrjnUxT4v?=
 =?us-ascii?Q?jDAwEPXyWldNrYcaO6z1YbYWm57OZh7h3wnPS2NNuPdRZyZWlm512ddNzqL5?=
 =?us-ascii?Q?9Lel3111qtoz/JWCmT2l2iRBvNxmedWMYGbwpJzWBVq4XJL7PZ1bNiluGI4R?=
 =?us-ascii?Q?wz1fscSf1xskxvev9cT8tpj95vZAlywUT8gdYKr02+SIcqz5uU2dAfRuN+6i?=
 =?us-ascii?Q?J3kDcqB8bVXDoH9DDXeaC9HlWdzHiXBA/lBuQn3cvUgBm6MyUJ+fGShwy8I/?=
 =?us-ascii?Q?uA3i0k8JNPxQw45Kf0uSPrzqu74hDsq7/OtMKQndZ8XFcyIf0WQv3bR7TjHS?=
 =?us-ascii?Q?fNvIYwbukBOZ6iimgWu0RKA2FkjBKNr9MtYLd4H27nKqjhIzDwqjLTKpiZRY?=
 =?us-ascii?Q?IeTWbgbU820+JzArHUsXwZYBfXSE7qGgclGzZej2nYG4pft6Q/4dQA24Ni6Y?=
 =?us-ascii?Q?kbRlWUElqwBwWN2leGp7SSNyqn+sKyvRdbYYB6Eon8Mly4CLniRm3FxYA/HE?=
 =?us-ascii?Q?KGJr3npi7G9ZvvLygZbuaj5tlvvrqoEDycT1RBiu7VnX24/Otetnc260fFMh?=
 =?us-ascii?Q?GpAjXeIQNvN90CS/kRKyqMhrSkyUseE6XwTJoQ3SXeYqa2uhdsjmwBEdYYlp?=
 =?us-ascii?Q?b3dHlXwt5B7tigQ4DF8TNHGT4DqCu5aSuftSW+zkPKd1BcKOQ0+AWzmgVyI9?=
 =?us-ascii?Q?vk6Ud1KK7ka3w/kHMwHCJHX2BPUay1oyp2OAR9tqvjWBbIWART0WDvTLhx1D?=
 =?us-ascii?Q?O8uTjBTiw80PeL0FyoI18FQ9vIjnSF5lKBYISw4RXryWXCLbDQsaUSslsGvP?=
 =?us-ascii?Q?1t+hiwxySVoSylKiyCaZBAjX1xPelEdHHod6/BakG3vSMfai1zPtjaNOW3gv?=
 =?us-ascii?Q?pCyfpZHEDbp66EUPsbRclx8cyoI+Nx62rgSTuNRsbmLf8UPjGYjOg/6EWXSY?=
 =?us-ascii?Q?wFHnAkv7LSER1cmdQFomvAJ2lAgM9O+ML1hqXhT5pKN4GyTGyjcAsD7KO39a?=
 =?us-ascii?Q?wPDL44Fs9dCr+4qTiFQK1DLnwlL/hJTDFHfBqRIQvvtS3UOzZdYEEmlkDGwr?=
 =?us-ascii?Q?ZJxa/mbSXTaQk2/E7LLM9OaJu1iQKjeHS9f4pa/SRdZj0sKiDwldmVwoqNHj?=
 =?us-ascii?Q?Znn+XNPGGu0Qax/7qiodQC9Vd7pYHEkVyolUekgYzUoiM64QPIUpMXMzVLSS?=
 =?us-ascii?Q?z6YXm9sTmljXcmOzeB2rHiSF2KAMIp5p5iLtNBw0B2QO7iiVQyHO9ZBSZTS7?=
 =?us-ascii?Q?I9lxj1gI1A8NasfKE8n+ftNvsFKXyBtUXcX/xLABV+SmVgERyL22yhB4NFWc?=
 =?us-ascii?Q?OcgE0YkbgHfDT8X9BYcnT/bbbNhqUujCvhzI/6/yCArmQqofUxOhLzQx5bo1?=
 =?us-ascii?Q?wclVxWQCuGKuMhNofeamC5yV6srjlBTjrl0DjfHWqz+8+I4duB6z0xKo9zXb?=
 =?us-ascii?Q?WA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	eDcQ3N6MlCjxIpELSSuKYekw8SE9y8m0bdOm7p40oWTgJ+RVfwjIba/uVUkbIupRLXWvxpCPSt0rEKVNjj/zLBVpKl9wO4uGRiaPshmZ7xDaa+I0zwQwghrpDZVGuCd273XutToWqNi8Vgrn0ERiwfCMvw+UO7lI4hbb349flSAeyu4t0SJBtxHVK9tvzBskTMnl1S6ys3qhd/C6sDt+tvxQziacZ23Brg+WRw1ObYrACbAdetNU8HC7J7iYbpUPKFxJ/8Dro4gawmp/7uB2Oob2x2yIqaBlD8ugcS6oOLFGsJHQAO3XntAYgfpJBA8m4L6PwVTRMFvLeM8GNUl0GUgNH2cqqTAAvBmY7DOB00SIZoneT3ruP2P8YoL6Q8N1CMzaiaa5Nf2+1HvjooFs6hPxvTom78mfFsKzy4oyCFwrdFysIc20kR3T3Sv2B0EGTxs53azVVpAnwGBKCaifh/8bVdPC1uT723c9lXTuzVhYybsIeyyfKDxSVIi3P9DfRVeYEZTvxigzLNlXPcg8InkHqQ2u7q62qDu2kRWgQcd1ooiDKHfRQKiK4fNn4zkAlt9x2M/xC9W2eBduRfgTZbnDqcJ61Yp1iEC4y8JocEk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 824a589e-6057-4f1d-8839-08dcc5db95bd
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 14:30:08.1714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B/f4tgWPIbjqaiJEj8Qs79NKqFZwerenBKk/1WbrqaTJ2QlO+MAz6WcipVwx8dlyWd40fvPGOqyK9M9ymj46UazaYrdDbV6T8SOTtZNZH4I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6381
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-26_11,2024-08-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408260111
X-Proofpoint-ORIG-GUID: CS9_pqU8_O3W0k5u8J5VVJqlQrXFg0os
X-Proofpoint-GUID: CS9_pqU8_O3W0k5u8J5VVJqlQrXFg0os

This patch goes against the intent of the code, as far as I can see.  The
point of performing the size check prior to increasing the buffer size was
to enforce the limit on the size that was explicit set by the user.  Then,
if that size was sufficient, then DTrace is at liberty to increase that
size to a whole multiple of the page size.

But if I were to insist that a buffer can only be 24 bytes, and 24 bytes are
not enough to store a single trace record, DTrace should report an error
rather than increasing my bufsize setting on its own.

On Thu, Jun 27, 2024 at 01:38:57AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> The function had a few issues, mainly with its comments,
> ranging from typos to incorrect descriptions of behavior.
> 
> The function has only one caller.  The enforcement of a
> size minimum was problematic in a number of respects:
> - it was missing 4 bytes
> - it was enforcing the minimum before the size was
>     increased by the caller
> - it was checking dt_pebs_init()==-1,
>     missing errors with other negative return values
> 
> So change the function to accept a minimum and change its
> return values.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libdtrace/dt_peb.c                          | 27 ++++++++++-----------
>  libdtrace/dt_peb.h                          |  2 +-
>  libdtrace/dt_work.c                         | 15 +++++++-----
>  test/unittest/options/err.b-too-low.d       | 22 +++++++++--------
>  test/unittest/options/err.bufsize-too-low.d | 22 +++++++++--------
>  test/unittest/options/tst.b.d               | 22 +++++++++--------
>  test/unittest/options/tst.bufsize.d         | 22 +++++++++--------
>  7 files changed, 71 insertions(+), 61 deletions(-)
> 
> diff --git a/libdtrace/dt_peb.c b/libdtrace/dt_peb.c
> index 5268f089..4983ba91 100644
> --- a/libdtrace/dt_peb.c
> +++ b/libdtrace/dt_peb.c
> @@ -136,18 +136,14 @@ dt_pebs_exit(dtrace_hdl_t *dtp)
>  }
>  
>  /*
> - * Initialize the perf event buffers (one per online CPU).  Each buffer will
> - * the given number of pages (i.e. the total size of each buffer will be
> - * num_pages * getpagesize()).  The  allocated memory for each buffer is mmap'd
> - * so the kernel can write to it, and its representative file descriptor is
> - * recorded in the 'buffers' BPF map so that BPF code knows where to write
> - * trace data for a specific CPU.
> + * Initialize the perf event buffers, one per online CPU.  Each buffer will
> + * have num_pages * getpagesize()).  The dt_peb_open() call mmaps the allocated
> + * memory so the kernel can write to it.  The file descriptor is recorded in
> + * the 'buffers' BPF map and added to the event polling file descriptor.
>   *
> - * An event polling file descriptor is created as well, and it is configured to
> - * monitor all perf event buffers at once.  This file descriptor is returned
> - * upon success..  Failure is indicated with a -1 return value.
> + * The return value indicates success (0) or failure (-1).
>   */
> -int dt_pebs_init(dtrace_hdl_t *dtp, size_t bufsize)
> +int dt_pebs_init(dtrace_hdl_t *dtp, size_t bufsize, size_t bufsizemin)
>  {
>  	int		i;
>  	int		mapfd;
> @@ -166,12 +162,15 @@ int dt_pebs_init(dtrace_hdl_t *dtp, size_t bufsize)
>  		fprintf(stderr, "bufsize increased to %lu\n",
>  			num_pages * getpagesize());
>  
> +	if (num_pages * getpagesize() < bufsizemin)
> +		return dt_set_errno(dtp, EDT_BUFTOOSMALL);
> +
>  	/*
>  	 * Determine the fd for the 'buffers' BPF map.
>  	 */
>  	idp = dt_dlib_get_map(dtp, "buffers");
>  	if (idp == NULL || idp->di_id == DT_IDENT_UNDEF)
> -		return -ENOENT;
> +		return dt_set_errno(dtp, EDT_NOMEM);    // FIXME we used to do something more akin to ENOENT
>  
>  	mapfd = idp->di_id;
>  
> @@ -180,7 +179,7 @@ int dt_pebs_init(dtrace_hdl_t *dtp, size_t bufsize)
>  	 */
>  	dtp->dt_pebset = dt_zalloc(dtp, sizeof(dt_pebset_t));
>  	if (dtp->dt_pebset == NULL)
> -		return -ENOMEM;
> +		return dt_set_errno(dtp, EDT_NOMEM);
>  
>  	/*
>  	 * Allocate the per-CPU perf event buffers.
> @@ -189,7 +188,7 @@ int dt_pebs_init(dtrace_hdl_t *dtp, size_t bufsize)
>  			 sizeof(struct dt_peb));
>  	if (pebs == NULL) {
>  		dt_free(dtp, dtp->dt_pebset);
> -		return -ENOMEM;
> +		return dt_set_errno(dtp, EDT_NOMEM);
>  	}
>  
>  	dtp->dt_pebset->pebs = pebs;
> @@ -241,5 +240,5 @@ int dt_pebs_init(dtrace_hdl_t *dtp, size_t bufsize)
>  fail:
>  	dt_pebs_exit(dtp);
>  
> -	return -1;
> +	return dt_set_errno(dtp, EDT_NOMEM);  // FIXME need something better
>  }
> diff --git a/libdtrace/dt_peb.h b/libdtrace/dt_peb.h
> index e0f408f2..9ad23252 100644
> --- a/libdtrace/dt_peb.h
> +++ b/libdtrace/dt_peb.h
> @@ -43,7 +43,7 @@ typedef struct dt_pebset {
>  } dt_pebset_t;
>  
>  extern void dt_pebs_exit(dtrace_hdl_t *);
> -extern int dt_pebs_init(dtrace_hdl_t *, size_t);
> +extern int dt_pebs_init(dtrace_hdl_t *, size_t, size_t);
>  
>  #ifdef	__cplusplus
>  }
> diff --git a/libdtrace/dt_work.c b/libdtrace/dt_work.c
> index 69a86358..7a0eb1da 100644
> --- a/libdtrace/dt_work.c
> +++ b/libdtrace/dt_work.c
> @@ -267,18 +267,21 @@ dtrace_go(dtrace_hdl_t *dtp, uint_t cflags)
>  		return dt_set_errno(dtp, errno);
>  
>  	/*
> -	 * We need enough space for the pref_event_header, a 32-bit size, a
> +	 * We need enough space for the perf_event_header, a 32-bit size, a
>  	 * 4-byte gap, and the largest trace data record we may be writing to
>  	 * the buffer.  In other words, the buffer needs to be large enough to
>  	 * hold at least one perf-encapsulated trace data record.
> +	 *
> +	 * While dt_pebs_init() rounds the requested size up, size==0 is a
> +	 * special case.
>  	 */
>  	dtrace_getopt(dtp, "bufsize", &size);
> -	if (size == 0 ||
> -	    size < sizeof(struct perf_event_header) + sizeof(uint32_t) +
> -		   dtp->dt_maxreclen)
> +	if (size == 0)
>  		return dt_set_errno(dtp, EDT_BUFTOOSMALL);
> -	if (dt_pebs_init(dtp, size) == -1)
> -		return dt_set_errno(dtp, EDT_NOMEM);
> +	if (dt_pebs_init(dtp, size,
> +			 sizeof(struct perf_event_header) + sizeof(uint32_t)
> +			 + 4 + dtp->dt_maxreclen) == -1)
> +		return -1;
>  
>  	/*
>  	 * We must initialize the aggregation consumer handling before we
> diff --git a/test/unittest/options/err.b-too-low.d b/test/unittest/options/err.b-too-low.d
> index bb77e37c..f62155dd 100644
> --- a/test/unittest/options/err.b-too-low.d
> +++ b/test/unittest/options/err.b-too-low.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2022, 2024, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -12,19 +12,21 @@
>   */
>  
>  /*
> - * We use a buffer size of 59 because that should be just too small to hold the
> - * trace records generated in this script:
> - *	- perf_event_header (40 bytes)
> - *	- size (4 bytes)
> - *	- gap (4 bytes)
> - *	- EPID (4 bytes)
> - *	- tag (4 bytes)
> - *	- exit value (4 bytes)
> + * We need over 4k bytes for the 4 string trace records generated in this script
> + * plus some meta data.
> + * A bufsize of 1 to 4096 bytes is rounded up to 4096 and is insufficient.
> + * A bufsize of 4097 to 8192 bytes is rounded up to 8192 and is sufficient.
>   */
> -/* @@runtest-opts: -b59 */
> +/* @@runtest-opts: -b4096 */
> +
> +#pragma D option strsize=1024
>  
>  BEGIN
>  {
> +	trace("abc");
> +	trace("def");
> +	trace("ghi");
> +	trace("jkl");
>  	exit(0);
>  }
>  
> diff --git a/test/unittest/options/err.bufsize-too-low.d b/test/unittest/options/err.bufsize-too-low.d
> index bbbdb5c5..25efdf72 100644
> --- a/test/unittest/options/err.bufsize-too-low.d
> +++ b/test/unittest/options/err.bufsize-too-low.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2022, 2024, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -12,19 +12,21 @@
>   */
>  
>  /*
> - * We use a buffer size of 59 because that should be just too small to hold the
> - * trace records generated in this script:
> - *	- perf_event_header (40 bytes)
> - *	- size (4 bytes)
> - *	- gap (4 bytes)
> - *	- EPID (4 bytes)
> - *	- tag (4 bytes)
> - *	- exit value (4 bytes)
> + * We need over 4k bytes for the 4 string trace records generated in this script
> + * plus some meta data.
> + * A bufsize of 1 to 4096 bytes is rounded up to 4096 and is insufficient.
> + * A bufsize of 4097 to 8192 bytes is rounded up to 8192 and is sufficient.
>   */
> -/* @@runtest-opts: -xbufsize=59 */
> +/* @@runtest-opts: -xbufsize=4096 */
> +
> +#pragma D option strsize=1024
>  
>  BEGIN
>  {
> +	trace("abc");
> +	trace("def");
> +	trace("ghi");
> +	trace("jkl");
>  	exit(0);
>  }
>  
> diff --git a/test/unittest/options/tst.b.d b/test/unittest/options/tst.b.d
> index 57fa030d..3bf08edc 100644
> --- a/test/unittest/options/tst.b.d
> +++ b/test/unittest/options/tst.b.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2022, 2024, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -12,19 +12,21 @@
>   */
>  
>  /*
> - * We use a buffer size of 60 because that should be the exact size necessary
> - * to hold the trace records generated in this script:
> - *	- perf_event_header (40 bytes)
> - *	- size (4 bytes)
> - *	- gap (4 bytes)
> - *	- EPID (4 bytes)
> - *	- tag (4 bytes)
> - *	- exit value (4 bytes)
> + * We need over 4k bytes for the 4 string trace records generated in this script
> + * plus some meta data.
> + * A bufsize of 1 to 4096 bytes is rounded up to 4096 and is insufficient.
> + * A bufsize of 4097 to 8192 bytes is rounded up to 8192 and is sufficient.
>   */
> -/* @@runtest-opts: -b60 */
> +/* @@runtest-opts: -b4097 */
> +
> +#pragma D option strsize=1024
>  
>  BEGIN
>  {
> +	trace("abc");
> +	trace("def");
> +	trace("ghi");
> +	trace("jkl");
>  	exit(0);
>  }
>  
> diff --git a/test/unittest/options/tst.bufsize.d b/test/unittest/options/tst.bufsize.d
> index 96b0f1b8..23af81aa 100644
> --- a/test/unittest/options/tst.bufsize.d
> +++ b/test/unittest/options/tst.bufsize.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2022, 2024, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -12,19 +12,21 @@
>   */
>  
>  /*
> - * We use a buffer size of 60 because that should be the exact size necessary
> - * to hold the trace records generated in this script:
> - *	- perf_event_header (40 bytes)
> - *	- size (4 bytes)
> - *	- gap (4 bytes)
> - *	- EPID (4 bytes)
> - *	- tag (4 bytes)
> - *	- exit value (4 bytes)
> + * We need over 4k bytes for the 4 string trace records generated in this script
> + * plus some meta data.
> + * A bufsize of 1 to 4096 bytes is rounded up to 4096 and is insufficient.
> + * A bufsize of 4097 to 8192 bytes is rounded up to 8192 and is sufficient.
>   */
> -/* @@runtest-opts: -xbufsize=60 */
> +/* @@runtest-opts: -xbufsize=4097 */
> +
> +#pragma D option strsize=1024
>  
>  BEGIN
>  {
> +	trace("abc");
> +	trace("def");
> +	trace("ghi");
> +	trace("jkl");
>  	exit(0);
>  }
>  
> -- 
> 2.18.4
> 
