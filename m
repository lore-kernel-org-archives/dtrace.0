Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A2C154C14
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 20:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722456682; cv=fail; b=Ag9YvAkf84CAx4RBdEkLLwHXMw1W4rob2PeHIBcU2Js0pYFNTpARTRdK+9S3OCeCdg+ao3VdkxPc9qwDytfOHMougV1KbIQZUpNT8i0IHkvIs1i6srYJ5HVGM2iplgGk8SC1dgpDLYJ2Nsore5XGb6HeSHpHRW/kcA3yTeFjAvk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722456682; c=relaxed/simple;
	bh=f5bYh/gQ+NLb263PI4VgX7eVEbxY39HGKFMOn0Ux0oQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=t2d8csuUKv2cMMf9PHVyRAWt9Kkb/6AMKyLjgTsxhnBDnGq4ViDTz6ak+JsMcgUuxHb1mv2xT2KMjvNXp2cHw3/HuxQO2uIHwCIaU9KUHyIB57YLc9qBCe45rKFBXg9fYyL8U6YVVJu5JRDxoSYS3Mx8M6N6F8bGHT0DTl6MzFI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GZ57JNAz; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Dt0Kz9GC; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GZ57JNAz";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Dt0Kz9GC"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46VHtVPR012010
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 20:11:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=9TtEKMrUgX1tFd+
	J5Rw1GM7tRec0xKDF//2hZuaHIDA=; b=GZ57JNAzcJF2lHjBbHm4llfrvKZGAvJ
	4BZvoJ2UbpdK1nUzceZ9o/WS4tmsNR1RqruS3CGJEYxx/DK5PjJ+JkgJ0aO4MCuU
	eOHRM57Vba1O0KlMsonNBcEcBCCBMb3WNUSVdEJTptTtOyKY4sMhvyRTzm7vegBE
	3kYUclf/qKejJg//Kp7nLrxF3xh321X81mOfQV9MbykGr4Q3FffLnDFCWyvwqXc6
	3ETFfGTIawh3PtIwhcyZRTOXP3iF7yqBq+oh602r2MAasAi/dbt4FSdRVNmPpAtt
	YZG7aNtAiO82WZyC2HNy0k2fD4q/2fbPo8GDYbrwkAhYmI44CDyCX9g==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40mqtarad2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 20:11:19 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46VIhftX005807
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 20:11:19 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2040.outbound.protection.outlook.com [104.47.56.40])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40p4c1yd6x-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 20:11:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KGjauSpKzW90pb/DWAq6sQ6PW5zmNugNXn6t/hWZwjQud9bjvnV7soM6ypwNYBjRriegQ0dp/tWD2SV890mxzpooZ/FY9qMnZaBwJYUhaPUZc1PAX987c3ZtyH/XBVYrP/fzGI2FoitKe9Wqbvx6dEl3c/DgWxcFm6KgBjaRlxqC15kYM2J/Ge6+idyJ4o6Py8XZGjKFqPtzYDuc+eVI21xB/KBx6pXhhSWeIuMaTzCQeZjpMjfYmGvOUmy21bmizN0gFyLAk5XJw7hMZ1B33rfPi5SOlt+XNtWOBcsZJMqzHgCx5oUX7MPJQ3G42Q/pESPXvWK9f2qMnlDxBuvCgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9TtEKMrUgX1tFd+J5Rw1GM7tRec0xKDF//2hZuaHIDA=;
 b=eI0fkAYt0ZPe9EoHhcFzBNdYb3G8ptKBdgXmRwXfTqdgN7NWZ4FGFHK0z6/qClRdS7zYC71yikWOJYwxlsbxSYAewHs+Kdh74mIeVK7z4E4cE9A+XmEceGuWMIe19hWs1YKJiRyAK8be+wHeh8MdMaybL3P4OMGZ08Iv5f0N2hjDiD8IE+RBOSf7P/UN1hyD16Py00pfWscBx83pWiPxt03OsE6brUtggwd+wlFhysQHMP0Y6TdPHZQqlenn+v7rSSp3TEXO48B/39EA3utiFsKoSI7d8E9bhVC/xuIxRGgJKgzHC+mkZcImp1s5UNe5uPMRXs8UlIriGK2uS49a6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9TtEKMrUgX1tFd+J5Rw1GM7tRec0xKDF//2hZuaHIDA=;
 b=Dt0Kz9GCIaBO6kbzsonteYFogH0JR8QaY43lypZ9R7kkUKU1YUXpcmXNLI61NOWUtOadw/mkNWavHNncF6ePCxYO2+mBJHP9EmielB9MUQTHC78IdDEm9J7s71qu22dPOU50oxtlOtpneZfagX8b2jy6IY1px00uJXAo4T0O/FM=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by LV8PR10MB7728.namprd10.prod.outlook.com (2603:10b6:408:1e7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Wed, 31 Jul
 2024 20:11:16 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7828.016; Wed, 31 Jul 2024
 20:11:16 +0000
Date: Wed, 31 Jul 2024 16:11:13 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 0/9] relocatable DTrace
Message-ID: <ZqqaYbavY9AMUiEP@oracle.com>
References: <20240531185928.363245-1-nick.alcock@oracle.com>
 <ZqqOogLNszSvuMmW@oracle.com>
 <87a5hxmj5n.fsf@esperi.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a5hxmj5n.fsf@esperi.org.uk>
X-ClientProxiedBy: BYAPR02CA0030.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::43) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|LV8PR10MB7728:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e317687-3418-4674-9549-08dcb19ceee3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gu+70hVRAl4k8Yg2H72bl4p+M2iYDGdIiLdLo8PDgfjw4w1pmQXY00OdxVUe?=
 =?us-ascii?Q?G7+T7r9NLvjXz+zZ7ACRtwoyw3b1Wmt8xQ4AKWNWy7YEf7wojibMcV6s7OK3?=
 =?us-ascii?Q?zRP14nga2SO/MzR6Yqls5KjXmA1zRKFW+RP3Pg/T7BHARG2lz/mZxP46hMj5?=
 =?us-ascii?Q?lMLC17JVxUNQWqDV5g4+IoVHPwgielXtR6LoTzU0doJr17Gpy/O4e7HAznb4?=
 =?us-ascii?Q?MR0tc6raVLMIiJL9FYh/oJk7/tg8R2P3go64tVJLI3tqlJ8vjjeMQGx1GAb2?=
 =?us-ascii?Q?1wAgTqzW22C/oK9c57tbBD6rsKEi+WGg5IGskXp7d278i0dbNzBSoSMpVdNY?=
 =?us-ascii?Q?q5UJTqGfSe0/6s/mFgLHGzyTDesh1LOtNmFAXyr09e4lhTGhqVdtB6t1BD+M?=
 =?us-ascii?Q?Ro6MeYf5PCbcxwg6V2V0AbChiTmNmD44TgwzAtFv78F9V0JZeAThNUshD/XZ?=
 =?us-ascii?Q?3u4rhmfQEWGEYMCP6199MR78dI9dBcWjqdjQIj/hFTSxXIuZy9W9QfrQAexE?=
 =?us-ascii?Q?XqWsDJJWo0GxDDIGT8yzCIYXPDUN4jbDu2mnbRT/HR48K2iDaXb9W83EJalz?=
 =?us-ascii?Q?2ELaLTgDA8uA5qDvqOmhTXvJ8DhbRAnIWuJshR6FbCbH3ND1hyin9+ho+7Nn?=
 =?us-ascii?Q?QICM7L26jSXIs9TZ6/ItJieCqy1+XYnZ86fyFD3ocW0aCJTzmpARRcADxBOy?=
 =?us-ascii?Q?knU0ZvGVhyhAXOk5wFvRnYpOBZv6qM7LV5aGel8rOwDnXnT52pl6F1QuoKin?=
 =?us-ascii?Q?/91Rujl/K2oHxp1W+JnmPuCP9Z4/QTxQsvsFaapJ92rcfrbe92F2HyvFL7+5?=
 =?us-ascii?Q?lAMeP3xICyqQfaVKYSOtikw9dkFOPgMjg2ZrtBbTk175VPH8hMWTzSYU0u7M?=
 =?us-ascii?Q?x4bdhCc22VfMCQqo30NUdR/moz2eDZD+URswW0sXgFv3fdUOetFanrMdNl8T?=
 =?us-ascii?Q?YPHCME5V1FSPMusl4+3BJtdeGXRjO2IBPLkNjrrIa/Au9S7HJ7GcijqQpKFZ?=
 =?us-ascii?Q?N4Blf9r6WgZD5kymPDdkGhoPQc7k2AV3tmLs/N12qfABks8JzqmY4sMTI6gh?=
 =?us-ascii?Q?f4x16RKNYZnluJANLkru5wmJOjvjVd2XDqkqxd/zH6sRhb230nVcxEmlXn8r?=
 =?us-ascii?Q?3IJ1SGO44h6esJYVwrsi4DRtuquZ0pG5yTJQThxFKXBMZaZLLbAbLkDtkaLi?=
 =?us-ascii?Q?leZOt0k/VHHbQNwLzm4yLoUbilFNLsykYMsFaFt5I+UQnSB8kyTsfAooiHJ4?=
 =?us-ascii?Q?L4n1Xq6Ai3DEr1SmK/2YXHmCKlxUJ5RdlAlOmPy0Rc/KcIQK2Tp7K2Grvd8R?=
 =?us-ascii?Q?XMpD9/3xiijazcWCLElcdzIJ2JKLYnBox9sZfzFD0hdE0Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Lg5n/q0ScTwnRmHJAccd+Q1Ju5RZs2PZM49VQV1wvpsPM2s8Il82wH+RVFI1?=
 =?us-ascii?Q?X4ndVpTOHLXNoYFSmIt2zvPM+KyLS/g++OV34Epo1ZrOuOGPh5Ons1nqESEs?=
 =?us-ascii?Q?nhJzQUP0YEHkiXKcdbCA01vU7M0v0i44fBjoH1GkAD9LauASiXiGkkCYHcdX?=
 =?us-ascii?Q?MVCEzsNHw/ncpX0gMFnKdAFwXkAh16o7SiCIgYR/sXHPiuNOoSfcNgDAIVzT?=
 =?us-ascii?Q?I3ABKsiCutMYiZAoK2nP6zfIH6dAOKZNlGxyFybkaXzEl4m+A376D5Sxx5qy?=
 =?us-ascii?Q?U5ecN2qvO9OhtQAxI+oVtCDWRsY+gzhaXkXW2wvG9mEUNB3Ykez91K1yivYT?=
 =?us-ascii?Q?ZFrMQT/sNRVtJWiy7iIl/atrER7d4UwzpibiLTTU9Zec/2Z+N3G8UK4bfY1i?=
 =?us-ascii?Q?HOL/p+aNtuSO0Su4iXE8YsVsCxGJNQZ7WU4/YROkBn0RQWpEhLAV2xFiPHFH?=
 =?us-ascii?Q?pItiSka7AJ8wH64sj3Zdx+Div2b3PlGFI8ia4X9qFrlwqg44mDLAr2p99rQN?=
 =?us-ascii?Q?bOr6R+fPh0imaqIrH53GdtPtoq4g61kPlzQ3+TUBiK2lc21WBRH3tUalF850?=
 =?us-ascii?Q?ZJrGL0YaGFp0K9zektwi79ZC/sSyzqyk0aYlvh0HPYcILbL7JT2nG4emgk3m?=
 =?us-ascii?Q?r6JaWRLnVtpvpu5rhb7DwfV/zUfyOjTLaNfyh5bZ6MxYowXh+oVJwbn+YT3O?=
 =?us-ascii?Q?CFT3j6i3t8l/VPfvSpRw3XC5Ks+mnKO3LCiyDXRA4dfhoMMcQANjqpZRlNFa?=
 =?us-ascii?Q?IalrTEPFdIqrLZLCwSn0EP+WlnSR9VZ3h85PsLeSpVxm4jOMabTIrKR5EwD1?=
 =?us-ascii?Q?c2JUzZWb4WrUDCUis989LMkmRc9uunVzLEf+hoZV9Eu62c1a+UAzMT7wJ4wb?=
 =?us-ascii?Q?2PukE/ybKBCe469GL0NQ3BkiNymRPAomRdZgnD6kZwDan8UoUedhEa1mbBdj?=
 =?us-ascii?Q?87sEpg4iVgsGlD5Eq3fOWfBL121FE4obVI84Ip06eZ+1w9TJ+kpwn8mzKJox?=
 =?us-ascii?Q?ErWefl8sWw54HyvJxC8z9tpB0TddholGYf3PUs317gaUiO5E2Sbhp7DzidTy?=
 =?us-ascii?Q?AO+61lXVDuN6tTCu7v56Wh8klManf/QTYMqrRh5K6hTijkYWsutPY0qMpli3?=
 =?us-ascii?Q?jp8lq8K9cWgHcJzoC4ygbN8b9C6uHsHBaRSmT6HcDlhoyKrxHclVIjyZ/DdW?=
 =?us-ascii?Q?ff2KhKAwHRN7jFDcZtIrDaLjVE2vHetpSHoGa2o0NwqURm7WizSbtPJ+Clgb?=
 =?us-ascii?Q?U5d3L6Pbm4NDOSVUu7sZp0I79kgp+qr8ZVxzKJ9UcTIJIQsL7cXKC2KCXzKM?=
 =?us-ascii?Q?WJ3fe96Bku+v+NxvjxbE28lNXo9SpMk8vHUCbowNkTGOVYd66Y5WnXRy6o9W?=
 =?us-ascii?Q?Sf9DlU2+YavuXirpGej4spAn+DuQ/kQgoYRkVfvsPacMOkaXsv75YT1fjS0U?=
 =?us-ascii?Q?D3TAnDCPBEvzIsCjMJ1ncG+JPMy51BhodhrKQROYX1NEHj95sIeykcF26Mdi?=
 =?us-ascii?Q?XQQkaZ5jUKzPDFywcuhk6Ini9VIGHaDU+OKhvrWGLVi6cjrQGmBi/K2zR55Q?=
 =?us-ascii?Q?EsGbXtLao3lEiwZb/Vpieif39ZISqU47b6G6hbMqY6TrNuosSOWlGMWcWcAd?=
 =?us-ascii?Q?7g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PQivMYyX7Hcl1mV9jHTAYEzg3RuI+vaX7CmGn3CYWv4wVmAcOIZsOYR5fNMUa9QAJotvPVe3bCszlcOOp4l0Fg6XXIDR3Mkr5T4QUeQGMKr3SPhJVZnthEMUa9RdYhS/d5LLJmo8XFH4ebR4J+omRBy46PL4i+y0LIYnkSJ9MsdoWUH3djLH8MhMNRYi2fNbwTBEkx+oe4J6mHvXUCtTvyjwwl59aGuwwVLtGaC1VrVos1GdJcpWOwFxdUIaYcZwWZu8Har6QaHVUSQbyRkHI998AppHGvKJWEV3WPCBCwdd43tJyMcslFKRXch+dkJ9iwz9dhrLin1l30nKx/AGsSclYBNtTwMV4xpVXq+EXiGs98KFBm3larBmM9AnDEalm+ywLLs7WvAmcgXbvP8q4PoKJC7qTSsraIw0o1lHUnpEP6kRIBxnlphUppYFEN9XmPjy3YrD2FQ5EXY8N5nGyYx7fLszKmXw/q+haCgmOQN4H258so2b4JnEW7tTwxeE9SL0PuHO9pkSFdhDDv/G0aCgjkOn+PZ0eGFz+CMk4nI2POq8pWlWj+eRaEeN5Ba83MjFoq5zTnyuTFOAYe/5+36IuR0ujjbwNPqpjrw7mx0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e317687-3418-4674-9549-08dcb19ceee3
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 20:11:16.2213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X37on4/H7/+kIKKg0IxTDtPphisHFPeyxXvikbvgEU/6W+KSPNIxz6X12ZCxwHS3/s5/7iB8oU/ddQ8cDXTyoDnhjAFnqGk+akNkSFGq79E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7728
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_10,2024-07-31_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407310142
X-Proofpoint-GUID: 4GKkKhKIzjrdjVPJvEljp5Q9Mm884KvN
X-Proofpoint-ORIG-GUID: 4GKkKhKIzjrdjVPJvEljp5Q9Mm884KvN

On Wed, Jul 31, 2024 at 08:54:44PM +0100, Nick Alcock wrote:
> On 31 Jul 2024, Kris Van Hees said:
> 
> > General comments because my review covers the entire series...
> >
> > Why are there two pkg_config files being introduced when it seems like a
> > single dtrace.pc one would be sufficient.  The dtrace utility is used both
> > for tracing and for the building of libraries and executables with USDT
> > probes,  I see no reason why a single dtrace.pc couldn't cover both.
> 
> Simply because there are two distinct use cases here that require a
> different set of libraries and headers from different places: "we want
> to use USDT using <sdt.h>", and "we are a DTrace consumer". Almost
> nothing wants both, only one wants a library, etc etc.
> 
> Bear in mind that more-or-less universal usage of pkg-config (as in,
> with CMake, Autoconf and Meson it is hard to impossible to do anything
> else) has the caller appending $(pkg-config --cflags $pkg) to CFLAGS or
> CPPFLAGS and $(pkg-config --libs $pkg) to LIBS. If we tried to use the
> same pkg-config file, this would mean that *raw USDT probe users* would
> find themselves linking with libdtrace! This is *surely* not what we
> want.

If people do that without actually checking whether it makes any sense, then
that would be an argument (to me) to not use pkg-config at all.  Using
pkg-config to get --libs when there is no library to link with is pointless
and merely shows that the person using this has no diea what they are doing.

The cflags argument I can accept, but then perhaps we need *3* pkg-config
files?  What exactly do we need this for?  Testsuite needs to know where to
find dtrace, so that could need a pkg-config file.  Anyone wanting to use
libdtrace would need to know where to find the library and what cflags to
use (finding the include files), which would need a pkg-config file.  And
compiling code with SDT would need another pkg-config file.

This brings it back to my original thought that if we are going to provide
pkg-config, we need to carefully think about what we need to provide and do
it consistently.

> pkg-config is not meant to be "one pkg-config file per package", despite
> the name: a huge number of packages have multiple. (The worst offender
> on my system appears to be Qt 6, with 136, but even a simple thing like
> xcb-util has four.)
> 
> > On that note, why can't pkg-config then also be used as a means to get the
> > location of the dtrace executable?  Why go through the trouble of performing
> > text substitution on runtest.sh to insert the location of dtrace when you
> > already use pkg-config in it to get the appropriate include directory for
> > the installed case.
> 
> Because I didn't think of it. That's an excellent idea. Adjusting
> accordingly. Will send a v2 of the whole series (because it's been
> ages).
> 
> > I think this series needs to be reworked to be consistent.  If we are going
> > to use pkg-config, then let's use it to its fullest extent rather than using
> > it for some stuff but then still hardcoding other things.  That makes no sense
> > to me.
> 
> Agreed. Anything else you can think of that's hardcoded? I can't
> immediately think of anything (because we can't use pkg-config in
> dtprobed.service, it's not a program) but you looked at this much more
> recently than me...
