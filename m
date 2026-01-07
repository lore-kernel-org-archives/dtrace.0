Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08CFC8CE
	for <dtrace@lists.linux.dev>; Wed,  7 Jan 2026 22:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767826570; cv=fail; b=neYr1CobeGsEU/EOFnhugSg4y2qRIqlCzJ8jcMa/62W9bIK7waN0ZCmpmcRHLALtEqng+Oj+KNitpqmIocaJgPS2x4C6B4nzKBjAxEVk4mp3s3zjvtWCeAFmWOPliUEgEcxagiwioVXEsKusjYbJKWnfuJ6UOdV6D75hiuMrd+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767826570; c=relaxed/simple;
	bh=pfw+7UHx3EE2Md/dFSWsjpsq2COr5O0o1sHLb9Gfg4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZUo/5nNFn7hsBFuJ8pU1YCw5JVvJ8qc+g34d3pjUkgrGuwDO7o0U2FmDcfyCFFaaXRHBTkWyeQhhwOEuec0MVajwgcsVj1f/jj/7gqN89s4+CMog9KE+wrxwPpZlMCqI1BIp58XsggDNC7fNgS4xkfi4aABF2CYHm8DpFEHbrpM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hJZUgsgW; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=zo72nFuz reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hJZUgsgW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="zo72nFuz"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607LT3592603355
	for <dtrace@lists.linux.dev>; Wed, 7 Jan 2026 22:56:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=q8DP9/atXdwwcnHfO9WJteUNK6M5pmPiFLPVc7lHgfc=; b=
	hJZUgsgWuWoVGglqRM+NG6WWNp699MNGIGfVUUyy4DXjo8A88b/REqWOrXDNn/DU
	4CY4JSAtobhBAHdvpHhl2nk+/nBHrTOue1bKGcQ7SMJ8fwCyoYMv4OisZ/oAwxYN
	/3TqJdiY4cI++r1AQR69+4s9Xwzj9DYQBt9GR/c5hdDaH/Q431hiT2FLc8vvFRIQ
	v/d7cnjvsim1V97s9B85IpFR1WY2/89ICSbncgQ44Z4Gmvabf0AUBUWUErEPY7++
	ObhY+yYi3w+x32PecEBvXQOA+0sEjGaxQHiO6cD6ihvnUvSI3JEYTv9OvlMSkASv
	J9OsFEHSk64E42ndq9eRRw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bhyeg83dh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 07 Jan 2026 22:56:04 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 607MEPJv039467
	for <dtrace@lists.linux.dev>; Wed, 7 Jan 2026 22:56:03 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012047.outbound.protection.outlook.com [52.101.48.47])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4besjeejh6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 07 Jan 2026 22:56:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RVvh401duqjfH61IW1HFxrBvVECSAz7j9kHfDZ7U994W473JFVzXrWjKJFtBT8JzOc0Es7y/RmCv4JAa6Bn/vqQVeZjzrrUWr9ACyvi1yYLDzLrBm41X1fqqCfHs/I5ssi6LfMigx6mF0HKYrbFMd6SDg0j5Ayz9uB4YHpocWQzHGHSlCJjAY5OCaxSF7raqctHePr12nLmB1NfDZwWzOj7fACos7d3PjB+XDqMf5yvd3PZsezEIb0y93NlYa+dMEr9iuCkIGhbGlLHoPPeeIu+ZEhCCnYoBI+kOejQOKwC7hBeqriyozPAjJJ3woM37udeguV2fCVmagQxJd8DNjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=adtQAy8ZR6pr5lrK8ZzkFaojRru2oyYQlk0U7+LZVHo=;
 b=uD3jYslev4Fd66nI3tiiUFaVvBhZHy0D9q6/iqCzWs2F7L5S4rePi0escpUmbL8HbyJida+XB0tUv/rkLCV0rZTcSAPpZ+uHBBoxU9ARXfnA8w2WfV23tJNp5KFue1zmDBBTp6cqi4dBDPlOqjor2XWncJYjUOA8hZdK/4xWxSUqT313qSVdK12NgJ4IPtcGgY7HAft4j7aT6bOyDJfFohb+CZp098kzc7Hv5aCB11yiTEaTlosue5DUoNlFni8sJOOZo8c0BnPru1joCOMpDDm714lYjBLCr4Te4r358DPa9RARdCcahlzIwLIssZz8NqM7ojkb35+f7ZiAxYQbqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=adtQAy8ZR6pr5lrK8ZzkFaojRru2oyYQlk0U7+LZVHo=;
 b=zo72nFuz7d3dEUeEilQ+yHlK3wrjsmvU9IYmEt3tgHUIqKFu6iVWZ5XAc8ku2v5GSX2P8EmDCdikmkZ/8fhtXInjXxxJ2BSPWz/ybtfMEAhku5kGhofmX+1dbBiha8eXW7lv48tGfoh3iPIJ6HBOEohBaSxazln6aBDK8s769Yw=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by PH3PPF0A29BA37B.namprd10.prod.outlook.com (2603:10b6:518:1::787) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 22:55:58 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 22:55:58 +0000
Date: Wed, 7 Jan 2026 17:55:55 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v3 2/4] test: correct file permissions
Message-ID: <aV7ke3WwP7G37pnu@oracle.com>
References: <DS0PR10MB752234D6A8CA009C7E01E158C284A@DS0PR10MB7522.namprd10.prod.outlook.com>
 <ec40b0e6-c7d2-acaa-c8a1-f2385aac1452@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ec40b0e6-c7d2-acaa-c8a1-f2385aac1452@oracle.com>
X-ClientProxiedBy: BLAPR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:208:36e::25) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|PH3PPF0A29BA37B:EE_
X-MS-Office365-Filtering-Correlation-Id: 7df638d1-d949-442b-cbb1-08de4e3feba8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?0Rq5g1ZK0qOD9V/W55YZB/nQ0P5LKE+g/FoYi6hnloe97hHnuGdDfd4zJE?=
 =?iso-8859-1?Q?4TVmvnSBpcvDKIx1p0tt/sejiduSY9Ofw5JvfYdl55hbjWeMy6kinp2CU+?=
 =?iso-8859-1?Q?MW6wt+uf5ZGnxKFlX1q2OZxkIUDTDvWArs7gq44wlm6Gq8G1LQGPKa1lE4?=
 =?iso-8859-1?Q?7Ng5BEbVM9TYm3oI3q1xV3CUSxhjwJMpYJBdqmAIa+LFZG2WvucvnXYSMc?=
 =?iso-8859-1?Q?3bUy3Aqv5q5fPIbvwNZ3u0I6smeY72aARg6Y4Vx7d16NTVEkr7J8pQC8sZ?=
 =?iso-8859-1?Q?egLRP9QyLrq1xqma0U8aH1uKj/vhDAWcJM39zUxALGHJ/OuXwKBdTCNAdS?=
 =?iso-8859-1?Q?QtlzexA9kuS79Qk3GQWwyJbAO5PCc6QdJDvbbuXFb2TzQowRZgmwl8a3Hr?=
 =?iso-8859-1?Q?WHgOnuJiaGK4Zrb6xOXuHotZnmomxykyGGesukHIi4w5PG2IaZmWqEfu8f?=
 =?iso-8859-1?Q?YOb1ijEFy6PsSJL4PZY/mBSJoWii0HJIpVidO0pPNbXZtgNeJvGKSjJqtY?=
 =?iso-8859-1?Q?POHYPPAh8mUJU4yCH8lnU3t3JrA+0HVkRPapEScI+e+PZX6ZRqE4dZi5As?=
 =?iso-8859-1?Q?zdtwwFWkulEN+dWDKEF8TDCiv8RJJiiQg1gaTLn9qwK7kSnPyt0HPXJXpv?=
 =?iso-8859-1?Q?suu2ESNn35W7dvMWjwKKoCQ72lfs47r2f57h5ZrpTZ1OZ2sbCykBeiXWA1?=
 =?iso-8859-1?Q?l2jYJNfxSn1xdNK46eEag7pjOYDB+9/urCTwBo/x5J9dzxGyAbv62lU0u4?=
 =?iso-8859-1?Q?ISDkrOg+LD8sidIqyTAqyTnhG96byW55A+EPzIpV+DmlE5dY1Y8b4GIiSM?=
 =?iso-8859-1?Q?kgGqoeUn9gE+20obcrzSUvXcmORldNaqukKxQB6jENzGf5t5i9NEJ2X0e0?=
 =?iso-8859-1?Q?27xYxDSRWXLydsgNQ7yYtADNy/HDBa5M7Jk0Rx8HNrEqJH0OmVLVrGpVQ0?=
 =?iso-8859-1?Q?U0n98SiWQJerOtMlB8YTIRrGYDAz6bL6dpKpBaUFtjse+h7MP2zPMETVQH?=
 =?iso-8859-1?Q?EYZKq/lt3glaHhASpKAHMpjj/Gvk1TJDfcGWiphq6HMwdtr0qG9uKt3X82?=
 =?iso-8859-1?Q?3vo0lJtVAqfkzoOFSLCpbNPwBe1PKoJ7Q8SPMbiCXffFMO3zto7qehqpnv?=
 =?iso-8859-1?Q?w4+UH8QXIMESxrHFZfau9UHZ+wHDQe83Wjzx6zmhXTKR+S2Rs0i3G/Zo5S?=
 =?iso-8859-1?Q?m2HRA4CD1gszZL0lrUpeJ5/VMkoZ338uPtHcm78b525x3RCHYXCuA5Z7/l?=
 =?iso-8859-1?Q?x+EGkxklvdIk2UH0iIv4f8NELgZig1mBhDv+8/F9awFnUMN7oSM7lxfGGJ?=
 =?iso-8859-1?Q?oVEShuZdj7BRrloPkHp4JN/VTB9XIr0ONgdufDTKOjuJOCyQgh8kjhbvTR?=
 =?iso-8859-1?Q?LnunS4W59Ueu5wQIxumnNh1W8cZtHfWvRnf4I1VN0gAUnTcx5MCiGNUf9B?=
 =?iso-8859-1?Q?XNqrRdS6sm9oouUaI2i1JAbVArATmffiNI+LU2Z3qS5AWvdAw/3QOo7qGd?=
 =?iso-8859-1?Q?QAybCu4fZYBWvbA/W0q0XZYTA2USQOjfIauaogPv9Vvg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?BHBrTHwcXNlvulTvxIx5wrxraVJ5yv4LgFJJFzTlXSlyU5ZToHGusLDr20?=
 =?iso-8859-1?Q?3Te1lrwc10RP/kV9NT/7KBdint5RnNaemS9270HG8CR8fbjuq+RlGX/054?=
 =?iso-8859-1?Q?6pAzowxrJbz1LT5pbfR4tU4L0Pb5HU4w2hFFxq5go4guKLKjw8+vtU2Ikw?=
 =?iso-8859-1?Q?Ms2EyEEIQAJCTBlj4EGyk/ccfxWKQ0RQXYUtsfoc8LjnYspuc6gaJf7V9B?=
 =?iso-8859-1?Q?aZldOvAAFnAYq5MS45IWZRToGoAkvMry25qgEpnuRNK5Eg+dTbS1eURpA5?=
 =?iso-8859-1?Q?ndBoXV+VfpF2MNVfB7pX4CeRPE0sxCUlyE2pFQAdaYjDKQSgDoa5JUncaJ?=
 =?iso-8859-1?Q?fW+jIoHUZkA3J7VBD+hu7fyPIMLdLSZ61n1JC99rcSwCirNRhOymXJCHr2?=
 =?iso-8859-1?Q?pGc3lLgpY8ohXW/e/KBlFKk7RRYNMpGyXmIYjFUUoK/8yAvDQz0E783UZY?=
 =?iso-8859-1?Q?9+45XnkGq8g37JoNWLo+PEvpaUVIAs4Fjef2DrpHzPRtLjpthL0szB5tu/?=
 =?iso-8859-1?Q?1rru2WER8IezHJVYrjD7C6Q6WWONzCIodloVJcrmjOv2JtmogjNPsO0/S3?=
 =?iso-8859-1?Q?J9B6zG61l+EUKw6W4QDIJd7QNVmXzozTP0oBaDZdOyW5ykewDfqi5Yweru?=
 =?iso-8859-1?Q?P20yLySu1ffySMMde2qBIHSw9mJD7kbGFWL6Egh3W0jP4SNepEtKnk2C8f?=
 =?iso-8859-1?Q?aLTCetMO/6fjK0Bhq2vV+o9fY7tlpVoOMfArif3xJmmlj0TFtoSI2CMfH7?=
 =?iso-8859-1?Q?Bt+YIevmY/rrBPuuG9yAWRVhD+EAIDxk/6KUP/HnlcGcsTkGFNC7D5VF+r?=
 =?iso-8859-1?Q?AOjwQZ8Rk6vvJh5pcsQ9uX8hiSrqTyoRPpEh51QQMQ+TzUE5lBql2s172i?=
 =?iso-8859-1?Q?suCWo5/g8+FrT1iz5GGaDWDp5Bmd519r7k90a+YEzKQyGEEVqV7t4/AYgA?=
 =?iso-8859-1?Q?O+Cv1j1q7RmGKHJWzodq1HI1AuiYZdiq89PwyNq0xKJtul7D5cXj8SxUpg?=
 =?iso-8859-1?Q?utjSEHDh0kCAJbr7GwIvFp5yIdzpZt0ORHhk5VyZ7KVAGrs+sLpPwL5HqE?=
 =?iso-8859-1?Q?t7hTnDjzkxsGSXfsMHyTp7nYDj83tiqLbATVu1VNaBh0JfXGEIlgyyhdVB?=
 =?iso-8859-1?Q?yw4ChT7RUYS2QPuo4JuKr1qK/ETW/hkacIirwcQ5B14ZtrjqIK1EMZ0guP?=
 =?iso-8859-1?Q?5lt/wk8CA+Ntm8AL43jJQvHG0vjtrD2ccnM4IzcSLDN7ITUwjh7FKoYW3I?=
 =?iso-8859-1?Q?MXeFMR0Ldt/5FBdFzSXwnLwfYDm2LQJsqdcfRkHiwpiiVrBnI/QWqPhXwj?=
 =?iso-8859-1?Q?f9aH4dbClIYYcUL+nFrcRECzRY5WBy55EsOomutghvWmhmNfsgYVsTr9bD?=
 =?iso-8859-1?Q?ZLKVymKoOZUyTxPQus0Ws46cy/SEDxiTFNkQPoI+9nKvF0S1FSIPfl2O8q?=
 =?iso-8859-1?Q?By7semvtxIoyKaXnhTmH0fTOMXj1Jb1GpKkMaWidgAclb64EGO9NzTDxGl?=
 =?iso-8859-1?Q?hSmdGnWMXkCHKvO5gscw0NVBEP8DQwkiP5V+vn/3CD3AXE5eQ4TgwfYel9?=
 =?iso-8859-1?Q?V7AzE9hj+G85Yq4WnPGDDhyskpw6qdd2Ynq7rpQm3kji93nYqgnYdDWnhJ?=
 =?iso-8859-1?Q?44eF5avCLipPZEhqTav0g5Loce/8yWc3mWpIBnJBUK3eIJP5TIloHtk1jj?=
 =?iso-8859-1?Q?ZPLP7e7SaISkbZXDM/6YF5hxBH3O7VjfdCrGuW4nLyodX9Aj+EFpqSJEsi?=
 =?iso-8859-1?Q?NhNM1VK7dNFB9iMMmeszmJ5fnQgcgKh871xPvQQeQyvTDLQmUeAPKLOb4m?=
 =?iso-8859-1?Q?/JUfJv3QWA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1gLjUROszTcAY0++kIZpLidFRvwS/OzitN+SKClESfKKdQ9UjK5pf4Bc3C0T0EHElm5Yvd5pOFSPcLDqixX5ybG41SggMfw2jc6ScZw5ydl6qTW+lslf2FQg3ClhNRb+Y4Njc3b3Br9f74XG6UcDDE+8naY4LM0d9xLc/dQPtQTCxPsqUQbL31qZmjViq0nord2mGOZuwyRiLAMKj8le7duzYWLBOj27MYrhT0CPR30yGrk3p+zOVjsRElQtunBCcW7tPxrzln/oa98uBlwMVjZuHg12T+BNrwa43KACFrSv2ODa0FWqAuK9gsmoqgMXzd6PQlQWmqc2jopO2e0yFbJVbzsM9ObkxgBcLL+BO1OSWC9Bg+XkC87EneYMrMrWnaUNGE+lI6I7O9Eyybo2a/eiUjjTs4cJPzi51khOdDtKi8NwVZAyjor0BmNYBWh6bCRc1uZV/3VZVTKrThmtij01zAe+K5r+35hyLGydZ3iGGyZlWhfhQbpAlYGSZSVNlIno2/M4WnqXT8Iz7w0VcXOyxS0QF67Dxz4R1pLIOGzqkwW1HZPucvRztkv8HycX66VCYqfzBtlR0Hv72Bagz2KV5kMpsMGQWIz6zXLEtZ8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7df638d1-d949-442b-cbb1-08de4e3feba8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 22:55:58.5534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Hhk02NFiJI1h7GWNe7P5vOYj7seEzBuezZzwz3uZK8D9quo/jQEPjuQ3V1XTS2gMl6wswZ/ulAzApuLAzVO9vJJtj25USF6YTgtqtW8isU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF0A29BA37B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_04,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601070182
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE4MyBTYWx0ZWRfX/uyDS751ucMA
 BKtNeJtgrqMXcaAt9PRXhMFUdTP0IuHbArZW6FzQPSVtJOMJrhSGsKIIUOzadk5mTLU6NMVerdx
 kAt9ORrlcmc9RZny6zgQb3HwAQc7WmHuI8pnLRTSZnEMksMq7KosqEZ73QxW3szssLVa9dykDn6
 15LXamTET85ypPUlSuU6IdaaCPV7Ep6U3qVcFz7y36PQHYMvuIj0xUxgyngVK00dw8E3VcXaGRB
 eFvw+M7y1sRQgYmBEmOr/ts042wlIcuYfJ0ajAddX5V97+/Db26eVQJmJXfLRMKsmJIEEAQH30g
 sF8lMlidGONHVCTXa4nJP7M6L5FWq2AJsMFOpGvKuM7PF287CIejNWZVZYjoo/lZrSZ/wzB/7EE
 uPZklKqu+FAUrdxwoAJsZcgpFt60X1bYzZrZpjUdjH9daS+WiFFwNh7GDVIwGt26F1wOknwwPqp
 fTR+0NND/9r9BAoUw2IgMZ/Bhy4lflh8cgxGkZLo=
X-Proofpoint-GUID: jwm4_FUU6wIwYwiv4OH3O0fGZSkwGsMi
X-Authority-Analysis: v=2.4 cv=QuVTHFyd c=1 sm=1 tr=0 ts=695ee484 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=BkzIeFEKR4gHwzga_BsA:9 a=XaXBPwxfFXEC9MZq:21
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 cc=ntf awl=host:13654
X-Proofpoint-ORIG-GUID: jwm4_FUU6wIwYwiv4OH3O0fGZSkwGsMi

On Wed, Jan 07, 2026 at 04:30:57PM -0500, Eugene Loh wrote:
> absoolute typo in commit msg

Oops, thanks.  Will fix.

> How are the tests running?  Didn't assign, pid, and pgid need the -q
> removed?

Tests are fine.  Those tests did not need any further changes apparently.

> On 1/7/26 11:28, Kris Van Hees via DTrace-devel wrote:
> > Various tests had a #!-invocation while still being expected to be used
> > as scripts fed to dtrace.  Removed the #!-lines and marked the files
> > non-executable.
> > 
> > Various tests that were meant to be invoked as standaline scripts had an
> > absoolute path to dtrace in the #!-invocation which was not recognized.
> > runtest.sh expects standalone D scripts to use '#!dtrace' so that the
> > correct path to the dtrace executable being tested can be inserted.
> > Corrected the tests, and ensured they are executable.
> > 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   test/demo/script/interp.d                                   | 4 ++--
> >   test/demo/script/tracewrite.d                               | 6 +++---
> >   test/demo/spec/specopen.d                                   | 6 +++---
> >   test/stress/fbtsafety/tst.vahole.d                          | 4 ++--
> >   test/unittest/lockstat/tst.lockstat-summary.d               | 0
> >   test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d     | 4 ++--
> >   test/unittest/scripting/err.D_OP_LVAL.rdonly.d              | 4 ++--
> >   test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d        | 4 ++--
> >   test/unittest/scripting/err.D_SYNTAX.concat.d               | 4 ++--
> >   test/unittest/scripting/err.D_SYNTAX.desc.d                 | 4 ++--
> >   test/unittest/scripting/err.D_SYNTAX.inval.d                | 4 ++--
> >   test/unittest/scripting/err.D_SYNTAX.pid.d                  | 4 ++--
> >   test/unittest/scripting/tst.arg0.d                          | 4 ++--
> >   test/unittest/scripting/tst.assign.d                        | 4 ++--
> >   test/unittest/scripting/tst.basic.d                         | 4 ++--
> >   test/unittest/scripting/tst.pgid.d                          | 4 ++--
> >   test/unittest/scripting/tst.pid.d                           | 4 ++--
> >   test/unittest/scripting/tst.quiet.d                         | 0
> >   test/unittest/scripting/tst.sid.d                           | 4 ++--
> >   test/unittest/scripting/tst.trace.d                         | 4 ++--
> >   .../speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d    | 5 ++---
> >   .../speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.r    | 2 +-
> >   .../speculation/err.D_ACT_SPEC.SpeculateWithChill.d         | 5 ++---
> >   .../speculation/err.D_ACT_SPEC.SpeculateWithChill.r         | 2 +-
> >   .../speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d       | 5 ++---
> >   .../speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.r       | 2 +-
> >   .../speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d    | 5 ++---
> >   .../speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.r    | 2 +-
> >   .../speculation/err.D_ACT_SPEC.SpeculateWithPanic.d         | 5 ++---
> >   .../speculation/err.D_ACT_SPEC.SpeculateWithPanic.r         | 2 +-
> >   .../speculation/err.D_ACT_SPEC.SpeculateWithRaise.d         | 5 ++---
> >   .../speculation/err.D_ACT_SPEC.SpeculateWithRaise.r         | 2 +-
> >   .../unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d | 5 ++---
> >   .../unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.r | 2 +-
> >   34 files changed, 59 insertions(+), 66 deletions(-)
> >   mode change 100644 => 100755 test/demo/script/interp.d
> >   mode change 100644 => 100755 test/demo/script/tracewrite.d
> >   mode change 100644 => 100755 test/stress/fbtsafety/tst.vahole.d
> >   mode change 100755 => 100644 test/unittest/lockstat/tst.lockstat-summary.d
> >   mode change 100644 => 100755 test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d
> >   mode change 100644 => 100755 test/unittest/scripting/err.D_OP_LVAL.rdonly.d
> >   mode change 100644 => 100755 test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d
> >   mode change 100644 => 100755 test/unittest/scripting/err.D_SYNTAX.concat.d
> >   mode change 100644 => 100755 test/unittest/scripting/err.D_SYNTAX.desc.d
> >   mode change 100644 => 100755 test/unittest/scripting/err.D_SYNTAX.inval.d
> >   mode change 100644 => 100755 test/unittest/scripting/err.D_SYNTAX.pid.d
> >   mode change 100644 => 100755 test/unittest/scripting/tst.arg0.d
> >   mode change 100644 => 100755 test/unittest/scripting/tst.assign.d
> >   mode change 100644 => 100755 test/unittest/scripting/tst.basic.d
> >   mode change 100644 => 100755 test/unittest/scripting/tst.pgid.d
> >   mode change 100644 => 100755 test/unittest/scripting/tst.pid.d
> >   mode change 100644 => 100755 test/unittest/scripting/tst.quiet.d
> >   mode change 100644 => 100755 test/unittest/scripting/tst.sid.d
> >   mode change 100644 => 100755 test/unittest/scripting/tst.trace.d
> > 
> > diff --git a/test/demo/script/interp.d b/test/demo/script/interp.d
> > old mode 100644
> > new mode 100755
> > index be690b56..fba39e41
> > --- a/test/demo/script/interp.d
> > +++ b/test/demo/script/interp.d
> > @@ -1,8 +1,8 @@
> > -#!/usr/sbin/dtrace -s
> > +#!dtrace -s
> >   /*
> >    * Oracle Linux DTrace.
> > - * Copyright (c) 2005, 2021, Oracle and/or its affiliates. All rights reserved.
> > + * Copyright (c) 2005, 2026, Oracle and/or its affiliates. All rights reserved.
> >    * Licensed under the Universal Permissive License v 1.0 as shown at
> >    * http://oss.oracle.com/licenses/upl.
> >    */
> > diff --git a/test/demo/script/tracewrite.d b/test/demo/script/tracewrite.d
> > old mode 100644
> > new mode 100755
> > index 0c139ead..f888ecd8
> > --- a/test/demo/script/tracewrite.d
> > +++ b/test/demo/script/tracewrite.d
> > @@ -1,13 +1,13 @@
> > -#!/usr/sbin/dtrace -s
> > +#!dtrace -s
> >   /*
> >    * Oracle Linux DTrace.
> > - * Copyright (c) 2005, 2020, Oracle and/or its affiliates. All rights reserved.
> > + * Copyright (c) 2005, 2026, Oracle and/or its affiliates. All rights reserved.
> >    * Licensed under the Universal Permissive License v 1.0 as shown at
> >    * http://oss.oracle.com/licenses/upl.
> >    */
> > -/* @@trigger: readwholedir */
> > +/* @@runtest-opts: -c test/triggers/readwholedir */
> >   syscall::write:entry
> >   /pid == $target/
> > diff --git a/test/demo/spec/specopen.d b/test/demo/spec/specopen.d
> > index e7dbc3b2..b3769789 100644
> > --- a/test/demo/spec/specopen.d
> > +++ b/test/demo/spec/specopen.d
> > @@ -1,12 +1,12 @@
> > -#!/usr/sbin/dtrace -Fs
> > -
> >   /*
> >    * Oracle Linux DTrace.
> > - * Copyright (c) 2005, 2024, Oracle and/or its affiliates. All rights reserved.
> > + * Copyright (c) 2005, 2026, Oracle and/or its affiliates. All rights reserved.
> >    * Licensed under the Universal Permissive License v 1.0 as shown at
> >    * http://oss.oracle.com/licenses/upl.
> >    */
> > +#pragma D option flowindent
> > +
> >   syscall::openat:entry
> >   {
> >   	/*
> > diff --git a/test/stress/fbtsafety/tst.vahole.d b/test/stress/fbtsafety/tst.vahole.d
> > old mode 100644
> > new mode 100755
> > index b918e663..732ae3ca
> > --- a/test/stress/fbtsafety/tst.vahole.d
> > +++ b/test/stress/fbtsafety/tst.vahole.d
> > @@ -1,8 +1,8 @@
> > -#!/usr/sbin/dtrace -Cs
> > +#!dtrace -Cs
> >   /*
> >    * Oracle Linux DTrace.
> > - * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
> > + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
> >    * Licensed under the Universal Permissive License v 1.0 as shown at
> >    * http://oss.oracle.com/licenses/upl.
> >    */
> > diff --git a/test/unittest/lockstat/tst.lockstat-summary.d b/test/unittest/lockstat/tst.lockstat-summary.d
> > old mode 100755
> > new mode 100644
> > diff --git a/test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d b/test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d
> > old mode 100644
> > new mode 100755
> > index 45c37efe..6fcb4d54
> > --- a/test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d
> > +++ b/test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d
> > @@ -1,8 +1,8 @@
> > -#!/usr/sbin/dtrace -qs
> > +#!dtrace -qs
> >   /*
> >    * Oracle Linux DTrace.
> > - * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
> > + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
> >    * Licensed under the Universal Permissive License v 1.0 as shown at
> >    * http://oss.oracle.com/licenses/upl.
> >    */
> > diff --git a/test/unittest/scripting/err.D_OP_LVAL.rdonly.d b/test/unittest/scripting/err.D_OP_LVAL.rdonly.d
> > old mode 100644
> > new mode 100755
> > index b51e1160..866a7f32
> > --- a/test/unittest/scripting/err.D_OP_LVAL.rdonly.d
> > +++ b/test/unittest/scripting/err.D_OP_LVAL.rdonly.d
> > @@ -1,8 +1,8 @@
> > -#!/usr/sbin/dtrace -qs
> > +#!dtrace -qs
> >   /*
> >    * Oracle Linux DTrace.
> > - * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
> > + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
> >    * Licensed under the Universal Permissive License v 1.0 as shown at
> >    * http://oss.oracle.com/licenses/upl.
> >    */
> > diff --git a/test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d b/test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d
> > old mode 100644
> > new mode 100755
> > index a4880cca..9a9d1566
> > --- a/test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d
> > +++ b/test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d
> > @@ -1,8 +1,8 @@
> > -#!/usr/sbin/dtrace -qs
> > +#!dtrace -qs
> >   /*
> >    * Oracle Linux DTrace.
> > - * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
> > + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
> >    * Licensed under the Universal Permissive License v 1.0 as shown at
> >    * http://oss.oracle.com/licenses/upl.
> >    */
> > diff --git a/test/unittest/scripting/err.D_SYNTAX.concat.d b/test/unittest/scripting/err.D_SYNTAX.concat.d
> > old mode 100644
> > new mode 100755
> > index 8f7b210f..8d6e5f64
> > --- a/test/unittest/scripting/err.D_SYNTAX.concat.d
> > +++ b/test/unittest/scripting/err.D_SYNTAX.concat.d
> > @@ -1,8 +1,8 @@
> > -#!/usr/sbin/dtrace -qs
> > +#!dtrace -qs
> >   /*
> >    * Oracle Linux DTrace.
> > - * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
> > + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
> >    * Licensed under the Universal Permissive License v 1.0 as shown at
> >    * http://oss.oracle.com/licenses/upl.
> >    */
> > diff --git a/test/unittest/scripting/err.D_SYNTAX.desc.d b/test/unittest/scripting/err.D_SYNTAX.desc.d
> > old mode 100644
> > new mode 100755
> > index 34ae864c..e8ec7851
> > --- a/test/unittest/scripting/err.D_SYNTAX.desc.d
> > +++ b/test/unittest/scripting/err.D_SYNTAX.desc.d
> > @@ -1,8 +1,8 @@
> > -#!/usr/sbin/dtrace -qs
> > +#!dtrace -qs
> >   /*
> >    * Oracle Linux DTrace.
> > - * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
> > + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
> >    * Licensed under the Universal Permissive License v 1.0 as shown at
> >    * http://oss.oracle.com/licenses/upl.
> >    */
> > diff --git a/test/unittest/scripting/err.D_SYNTAX.inval.d b/test/unittest/scripting/err.D_SYNTAX.inval.d
> > old mode 100644
> > new mode 100755
> > index d3338cfd..d2ae68a6
> > --- a/test/unittest/scripting/err.D_SYNTAX.inval.d
> > +++ b/test/unittest/scripting/err.D_SYNTAX.inval.d
> > @@ -1,8 +1,8 @@
> > -#!/usr/sbin/dtrace -qs
> > +#!dtrace -qs
> >   /*
> >    * Oracle Linux DTrace.
> > - * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
> > + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
> >    * Licensed under the Universal Permissive License v 1.0 as shown at
> >    * http://oss.oracle.com/licenses/upl.
> >    */
> > diff --git a/test/unittest/scripting/err.D_SYNTAX.pid.d b/test/unittest/scripting/err.D_SYNTAX.pid.d
> > old mode 100644
> > new mode 100755
> > index 01044d6e..1f383dd7
> > --- a/test/unittest/scripting/err.D_SYNTAX.pid.d
> > +++ b/test/unittest/scripting/err.D_SYNTAX.pid.d
> > @@ -1,8 +1,8 @@
> > -#!/usr/sbin/dtrace -qs
> > +#!dtrace -qs
> >   /*
> >    * Oracle Linux DTrace.
> > - * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
> > + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
> >    * Licensed under the Universal Permissive License v 1.0 as shown at
> >    * http://oss.oracle.com/licenses/upl.
> >    */
> > diff --git a/test/unittest/scripting/tst.arg0.d b/test/unittest/scripting/tst.arg0.d
> > old mode 100644
> > new mode 100755
> > index 905fefb6..d2aa4345
> > --- a/test/unittest/scripting/tst.arg0.d
> > +++ b/test/unittest/scripting/tst.arg0.d
> > @@ -1,8 +1,8 @@
> > -#!/usr/sbin/dtrace -s
> > +#!dtrace -s
> >   /*
> >    * Oracle Linux DTrace.
> > - * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
> > + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
> >    * Licensed under the Universal Permissive License v 1.0 as shown at
> >    * http://oss.oracle.com/licenses/upl.
> >    */
> > diff --git a/test/unittest/scripting/tst.assign.d b/test/unittest/scripting/tst.assign.d
> > old mode 100644
> > new mode 100755
> > index 9bbd8e49..cde5d64c
> > --- a/test/unittest/scripting/tst.assign.d
> > +++ b/test/unittest/scripting/tst.assign.d
> > @@ -1,8 +1,8 @@
> > -#!/usr/sbin/dtrace -qs
> > +#!dtrace -qs
> >   /*
> >    * Oracle Linux DTrace.
> > - * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
> > + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
> >    * Licensed under the Universal Permissive License v 1.0 as shown at
> >    * http://oss.oracle.com/licenses/upl.
> >    */
> > diff --git a/test/unittest/scripting/tst.basic.d b/test/unittest/scripting/tst.basic.d
> > old mode 100644
> > new mode 100755
> > index cd7b716a..792d6f06
> > --- a/test/unittest/scripting/tst.basic.d
> > +++ b/test/unittest/scripting/tst.basic.d
> > @@ -1,8 +1,8 @@
> > -#!/usr/sbin/dtrace -s
> > +#!dtrace -s
> >   /*
> >    * Oracle Linux DTrace.
> > - * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
> > + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
> >    * Licensed under the Universal Permissive License v 1.0 as shown at
> >    * http://oss.oracle.com/licenses/upl.
> >    */
> > diff --git a/test/unittest/scripting/tst.pgid.d b/test/unittest/scripting/tst.pgid.d
> > old mode 100644
> > new mode 100755
> > index 8d82f2bd..44ce7515
> > --- a/test/unittest/scripting/tst.pgid.d
> > +++ b/test/unittest/scripting/tst.pgid.d
> > @@ -1,8 +1,8 @@
> > -#!/usr/sbin/dtrace -qs
> > +#!dtrace -qs
> >   /*
> >    * Oracle Linux DTrace.
> > - * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
> > + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
> >    * Licensed under the Universal Permissive License v 1.0 as shown at
> >    * http://oss.oracle.com/licenses/upl.
> >    */
> > diff --git a/test/unittest/scripting/tst.pid.d b/test/unittest/scripting/tst.pid.d
> > old mode 100644
> > new mode 100755
> > index 2d0499d7..70197c86
> > --- a/test/unittest/scripting/tst.pid.d
> > +++ b/test/unittest/scripting/tst.pid.d
> > @@ -1,8 +1,8 @@
> > -#!/usr/sbin/dtrace -qs
> > +#!dtrace -qs
> >   /*
> >    * Oracle Linux DTrace.
> > - * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
> > + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
> >    * Licensed under the Universal Permissive License v 1.0 as shown at
> >    * http://oss.oracle.com/licenses/upl.
> >    */
> > diff --git a/test/unittest/scripting/tst.quiet.d b/test/unittest/scripting/tst.quiet.d
> > old mode 100644
> > new mode 100755
> > diff --git a/test/unittest/scripting/tst.sid.d b/test/unittest/scripting/tst.sid.d
> > old mode 100644
> > new mode 100755
> > index e4f1395c..670761d8
> > --- a/test/unittest/scripting/tst.sid.d
> > +++ b/test/unittest/scripting/tst.sid.d
> > @@ -1,8 +1,8 @@
> > -#!/usr/sbin/dtrace -s
> > +#!dtrace -s
> >   /*
> >    * Oracle Linux DTrace.
> > - * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
> > + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
> >    * Licensed under the Universal Permissive License v 1.0 as shown at
> >    * http://oss.oracle.com/licenses/upl.
> >    */
> > diff --git a/test/unittest/scripting/tst.trace.d b/test/unittest/scripting/tst.trace.d
> > old mode 100644
> > new mode 100755
> > index 148e5c60..f52b14ef
> > --- a/test/unittest/scripting/tst.trace.d
> > +++ b/test/unittest/scripting/tst.trace.d
> > @@ -1,8 +1,8 @@
> > -#!/usr/sbin/dtrace -s
> > +#!dtrace -s
> >   /*
> >    * Oracle Linux DTrace.
> > - * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
> > + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
> >    * Licensed under the Universal Permissive License v 1.0 as shown at
> >    * http://oss.oracle.com/licenses/upl.
> >    */
> > diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d
> > index 50bbf177..044b5a95 100644
> > --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d
> > +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d
> > @@ -1,7 +1,6 @@
> > -#!/usr/sbin/dtrace -ws
> >   /*
> >    * Oracle Linux DTrace.
> > - * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
> > + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
> >    * Licensed under the Universal Permissive License v 1.0 as shown at
> >    * http://oss.oracle.com/licenses/upl.
> >    */
> > @@ -10,8 +9,8 @@
> >    * ASSERTION: Destructive actions may never be speculative.
> >    *
> >    * SECTION: Speculative Tracing/Using a Speculation
> > - * SECTION: dtrace(1M) Utility/ -w option
> >    */
> > +#pragma D option destructive
> >   #pragma D option quiet
> >   BEGIN
> > diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.r
> > index 1590807c..206641c0 100644
> > --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.r
> > +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.r
> > @@ -1,2 +1,2 @@
> >   -- @@stderr --
> > -dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d: [D_ACT_SPEC] line 28: destructive actions may not follow speculate( )
> > +dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d: [D_ACT_SPEC] line 27: destructive actions may not follow speculate( )
> > diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d
> > index 47e248d2..e02577d2 100644
> > --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d
> > +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d
> > @@ -1,7 +1,6 @@
> > -#!/usr/sbin/dtrace -ws
> >   /*
> >    * Oracle Linux DTrace.
> > - * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
> > + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
> >    * Licensed under the Universal Permissive License v 1.0 as shown at
> >    * http://oss.oracle.com/licenses/upl.
> >    */
> > @@ -10,8 +9,8 @@
> >    * ASSERTION: Destructive actions may never be speculative.
> >    *
> >    * SECTION: Speculative Tracing/Using a Speculation
> > - * SECTION: dtrace (1M) Utility/ -w option
> >    */
> > +#pragma D option destructive
> >   #pragma D option quiet
> >   BEGIN
> > diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.r
> > index d01ab558..ab7c6ed9 100644
> > --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.r
> > +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.r
> > @@ -1,2 +1,2 @@
> >   -- @@stderr --
> > -dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d: [D_ACT_SPEC] line 28: destructive actions may not follow speculate( )
> > +dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d: [D_ACT_SPEC] line 27: destructive actions may not follow speculate( )
> > diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d
> > index 14cc1d5c..dbb8f294 100644
> > --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d
> > +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d
> > @@ -1,7 +1,6 @@
> > -#!/usr/sbin/dtrace -ws
> >   /*
> >    * Oracle Linux DTrace.
> > - * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
> > + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
> >    * Licensed under the Universal Permissive License v 1.0 as shown at
> >    * http://oss.oracle.com/licenses/upl.
> >    */
> > @@ -10,8 +9,8 @@
> >    * ASSERTION: Destructive actions may never be speculative.
> >    *
> >    * SECTION: Speculative Tracing/Using a Speculation
> > - * SECTION: dtrace(1M) Utility/ -w option
> >    */
> > +#pragma D option destructive
> >   #pragma D option quiet
> >   char a[2];
> > diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.r
> > index 89592786..f57aba47 100644
> > --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.r
> > +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.r
> > @@ -1,2 +1,2 @@
> >   -- @@stderr --
> > -dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d: [D_ACT_SPEC] line 34: destructive actions may not follow speculate( )
> > +dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d: [D_ACT_SPEC] line 33: destructive actions may not follow speculate( )
> > diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d
> > index 43a41440..00f56e1d 100644
> > --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d
> > +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d
> > @@ -1,7 +1,6 @@
> > -#!/usr/sbin/dtrace -ws
> >   /*
> >    * Oracle Linux DTrace.
> > - * Copyright (c) 2006, 2023, Oracle and/or its affiliates. All rights reserved.
> > + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
> >    * Licensed under the Universal Permissive License v 1.0 as shown at
> >    * http://oss.oracle.com/licenses/upl.
> >    */
> > @@ -10,8 +9,8 @@
> >    * ASSERTION: Destructive actions may never be speculative.
> >    *
> >    * SECTION: Speculative Tracing/Using a Speculation
> > - * SECTION: dtrace(1M) Utility/ -w option
> >    */
> > +#pragma D option destructive
> >   #pragma D option quiet
> >   string str;
> > diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.r
> > index 3bc21b18..da4038aa 100644
> > --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.r
> > +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.r
> > @@ -1,2 +1,2 @@
> >   -- @@stderr --
> > -dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d: [D_ACT_SPEC] line 34: destructive actions may not follow speculate( )
> > +dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d: [D_ACT_SPEC] line 33: destructive actions may not follow speculate( )
> > diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d
> > index 80a3204d..9fb6a1e3 100644
> > --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d
> > +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d
> > @@ -1,7 +1,6 @@
> > -#!/usr/sbin/dtrace -ws
> >   /*
> >    * Oracle Linux DTrace.
> > - * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
> > + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
> >    * Licensed under the Universal Permissive License v 1.0 as shown at
> >    * http://oss.oracle.com/licenses/upl.
> >    */
> > @@ -10,8 +9,8 @@
> >    * ASSERTION: Destructive actions may never be speculative.
> >    *
> >    * SECTION: Speculative Tracing/Using a Speculation
> > - * SECTION: dtrace(1M) Utility/ -w option
> >    */
> > +#pragma D option destructive
> >   #pragma D option quiet
> >   BEGIN
> > diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.r
> > index 3c120a03..7c15314d 100644
> > --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.r
> > +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.r
> > @@ -1,2 +1,2 @@
> >   -- @@stderr --
> > -dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d: [D_ACT_SPEC] line 28: destructive actions may not follow speculate( )
> > +dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d: [D_ACT_SPEC] line 27: destructive actions may not follow speculate( )
> > diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d
> > index a8c1c4d4..c239bc7a 100644
> > --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d
> > +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d
> > @@ -1,7 +1,6 @@
> > -#!/usr/sbin/dtrace -ws
> >   /*
> >    * Oracle Linux DTrace.
> > - * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
> > + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
> >    * Licensed under the Universal Permissive License v 1.0 as shown at
> >    * http://oss.oracle.com/licenses/upl.
> >    */
> > @@ -10,8 +9,8 @@
> >    * ASSERTION: Destructive actions may never be speculative.
> >    *
> >    * SECTION: Speculative Tracing/Using a Speculation
> > - * SECTION: dtrace(1M) Utility/ -w option
> >    */
> > +#pragma D option destructive
> >   #pragma D option quiet
> >   BEGIN
> > diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.r
> > index 136f5cde..6e85370a 100644
> > --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.r
> > +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.r
> > @@ -1,2 +1,2 @@
> >   -- @@stderr --
> > -dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d: [D_ACT_SPEC] line 28: destructive actions may not follow speculate( )
> > +dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d: [D_ACT_SPEC] line 27: destructive actions may not follow speculate( )
> > diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d
> > index a0bca73d..dd20eac4 100644
> > --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d
> > +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d
> > @@ -1,7 +1,6 @@
> > -#!/usr/sbin/dtrace -ws
> >   /*
> >    * Oracle Linux DTrace.
> > - * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
> > + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
> >    * Licensed under the Universal Permissive License v 1.0 as shown at
> >    * http://oss.oracle.com/licenses/upl.
> >    */
> > @@ -10,8 +9,8 @@
> >    * ASSERTION: Destructive actions may never be speculative.
> >    *
> >    * SECTION: Speculative Tracing/Using a Speculation
> > - * SECTION: dtrace(1M) Utility/ -w option
> >    */
> > +#pragma D option destructive
> >   #pragma D option quiet
> >   BEGIN
> > diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.r
> > index 8cdc6ba1..98725509 100644
> > --- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.r
> > +++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.r
> > @@ -1,2 +1,2 @@
> >   -- @@stderr --
> > -dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d: [D_ACT_SPEC] line 28: destructive actions may not follow speculate( )
> > +dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d: [D_ACT_SPEC] line 27: destructive actions may not follow speculate( )
