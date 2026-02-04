Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714DC32E72C
	for <dtrace@lists.linux.dev>; Wed,  4 Feb 2026 13:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770210667; cv=fail; b=aBGkeHSttCasnWhgirwN6fOWWaZnWYddGGpI6rP1XD+0VO+bZIW2x/95eb38TmhIA1Z6U1WX+X0iwHRBJ+/0HAzOuvoL7ZUg3KxJw7mBjwMuymSbxsFYw+ijS11UjZt+uYhY2/w40QpvfZ3rbZxJF2DqYwvx6ZbaauTH7OK0/TU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770210667; c=relaxed/simple;
	bh=Wt5Gyd4AoUSyP1AgJDfoaJCRHLMiHijKKEczXPa1wo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iitr63kZ3EOjLXhnXExIHHibWVLW1u3UDTW4A5VtG7yKl+Wgd//iECjs/XXVTkuQluH51TPrKTWUdKdhfMvwe71dcwVdL33kf0tLX/YwGOtpgAwYpEh3Fc2OWmNdWKYwb5rpiOJ22g6eo3aR1i/hJkGZC7Da2meoSWxAcRWH0Ms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mEsV3eTS; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Nz92VR4Z reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mEsV3eTS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Nz92VR4Z"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614AGE3a580141
	for <dtrace@lists.linux.dev>; Wed, 4 Feb 2026 13:11:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=88jqxkoSPB38RTXdiJ2Sh5A0wS/9b9gApN4lSRUFRWU=; b=
	mEsV3eTSIXLPcu80dObsPO87Erssr6duGSGvPKSrpBoOrcic1H3IWWfnwhj4EQl2
	1kDxfkkbn32jDhxc8Oww+R8yMoS0eJ1pkOkHjSPdpkPLOayCEFhVFeGqAo72ONEW
	A9zQEY3D5iXAF/IkdhqnxEax0GgFKmvAfgIL4h1cjQLXKM4tNjCS5Bn7FnjTylnq
	vWM3oOUsolFDnTIxKqcqd3XvMH8DIgBFBxPt3vhzxqD9Q3mdbw5dGnbHUqk2ZZ6j
	EF4xvS4s1N/JaurmU0jRSuXQ18OhPhtt3elGpk/3AxnmO/Y7E2vXWpX+c78AVGLR
	t9wUhesYXD1k/03blcuf7Q==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c3k5g1qw7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Feb 2026 13:11:06 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 614D5AsF018920
	for <dtrace@lists.linux.dev>; Wed, 4 Feb 2026 13:11:05 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010052.outbound.protection.outlook.com [40.93.198.52])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4c186nxkxc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Feb 2026 13:11:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J65zzrS24+odDQpDmr9jf2RohFHfjCg2/I5K8BheYBBk6QK6/nCtVQUE8uDukM2hjbA88fr8gEYCAxpV+1X61HOipkTLxU/HSgjB+Fgh6V99ey6BXbUX9wxhYw3LQjp7p1On2nEA3Gmc6wraLckla+VIysB261eFOBrAXSQWP4YgGHguat+hH6ydHy1+2+ASZGHc7E+1JIT3/ud6JVYpibBGoSQPro69gTCe8yf6ksMf+NMiYH+s0+ko06zt59tyRKgQq8f4tl4VFsUJI2XWLmVFdCadhYubq2moxumpMiZyPF11yuykYn8o9PBL7rmwCdLSw2lfCPZMvo+Qialw8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a1jWUnZbOul2eMaoFn2Te2USQi6SLycjD9uNoWe+KeY=;
 b=INcM13BpGPLGPTmxpe2uS/pnnRb7PvHyCodTRQaldDxq/HIIqSdduZuUEB5WLg/Qy1TTSrqs00cl24iYJx2cRkEt5bW7SNYyrKxbF6PGTlFkhQABF5rvwTpR2V45Rvn/wGfHifd2EoiAZqGV3uk2qvPBm8vo4fDma9vcigxSWXUCoDrDiAP9xZVapRgJ972PkKIrua64fE0MqGY7ixtznw4Bt5k6LASLJTgZKbvIgfQ0TazRYroANo+aW2AOGmEMBhRJnfGaFWuODS1tWkgUf6T6mu1i4SrGBhqqudwHpDarqxBnpgFkQ4pH2kiYn8uAUiGgIwJ7SfyE521h0R57bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a1jWUnZbOul2eMaoFn2Te2USQi6SLycjD9uNoWe+KeY=;
 b=Nz92VR4ZqH9g5VVuPHpMp9xGtuUHr7Oz60Y+UV1X6PKB+4TTOuZfc1Tn346wWIkUpHd+s3aWgdRBZ2tI9YOSkkMlIeF6w9g58y5zLXOfltqL6StdzTKSd3K7+XcichaEMSqIGKLTPuwHNtRa/Bd0hxEJfmiv37GhrBMXN8U9DiE=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by DS7PR10MB7132.namprd10.prod.outlook.com (2603:10b6:8:ef::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 13:11:02 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 13:11:02 +0000
Date: Wed, 4 Feb 2026 08:10:59 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2] usdt, stapsdt: fix argument handling for
 multi-location probes
Message-ID: <aYNFY8+19VmKMO1j@oracle.com>
References: <DS0PR10MB7522F828BE6550D1851B3CEFC298A@DS0PR10MB7522.namprd10.prod.outlook.com>
 <e995f8d8-205e-769d-1f4b-a78f448156da@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e995f8d8-205e-769d-1f4b-a78f448156da@oracle.com>
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
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|DS7PR10MB7132:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c17a8a4-1321-4ed0-9325-08de63eed87c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7142099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?jDHTwQmFMN/wvYbZgA39UHBTnqv9QELt///Cq7/RcPe7EUey4Fz7dxQcEh?=
 =?iso-8859-1?Q?p9tgFylHobU5omX2MEDWnr/tBoCGOrfd34sWWEoIx9xmuVrbb4fDSK6FXC?=
 =?iso-8859-1?Q?ayFGQ8lJptYfc0D8oc6J5OdSHt/wNQ0XXmK87FzOgEUEVl5cLWnFJFRHG1?=
 =?iso-8859-1?Q?ZFYgZwqWgRjLUvRj8Vb8lVG4rSrfTJtN4OQKTZvisGvp6x+aaKXC0k1pTB?=
 =?iso-8859-1?Q?cXyp96xGHVQSgvzR8eCECt5QBsg8AAuwyiQ6h0hVk8wNCPKZEKyqFQvlsb?=
 =?iso-8859-1?Q?EnISpqg38kuQGw3rMy19i2t9vQlcUf9Qlm4KxXMPz/pB8Ge7JiP0IS1E22?=
 =?iso-8859-1?Q?38CkEKiNe0sqP5fYE4znolgWgfW4Fth/Pq78plz8MQt20Jjz8p7xoSrkF2?=
 =?iso-8859-1?Q?x6jE18gQCy2spRalM5Wi3jMp1GAuRMvF89PyvYXlmB15uJRhEpvh1+pvoz?=
 =?iso-8859-1?Q?G7mHcGnEuukWGbLEbL9adBTo49LANmc6oXIKZ+5syD4tWM9ZQLeNpgvQnC?=
 =?iso-8859-1?Q?2hnyKCRgo2Tkb32z9guJ8msaP6AFq+ptI8gZXTEAS2Dn/538y3uF4DQzuk?=
 =?iso-8859-1?Q?KdLsK9GOktCtcQAOomoWAA7L4fOx5kuiOUkiGpHj+zIrq9Lv5fB5dBSfR+?=
 =?iso-8859-1?Q?Z5Qzwzc9uVGFQZB0wd+S8B9pUl4za6hzLemXLjnLbFBeEWTfNbe14EKZEr?=
 =?iso-8859-1?Q?Wt+y7W0iR8YVz+YZi5ytFnkrh0Hi3/Ek7wCIFDDhJfNRVIyMNWlRzMSOQd?=
 =?iso-8859-1?Q?47r9pgxtdGv5dT/IdfVOxy0IQjnwRCRh4XtQtqgwI+qIKkxuefk83iBFzW?=
 =?iso-8859-1?Q?4PemM25otCTlXqqdrsSMZ1PhA42b9ectF2NK0KSBijqGTa6QsdBhLoQ3dH?=
 =?iso-8859-1?Q?xS+oQmgxVrOsgOM41io0pD6+S2W9F/nj0+HTNzqWAoT4TYDK2cfyL2DCxv?=
 =?iso-8859-1?Q?jnXN3WrSHX1uX4DhoWT8afYxpiBmx/5tweH04sG0ypCazkLkVHqDfB0J0x?=
 =?iso-8859-1?Q?DftuAb8kaA/wSpkfy5OpgzcY8WxZ0JzyCx229LVTPDMtweoMVudsqS+Irq?=
 =?iso-8859-1?Q?Kcj5OSZla16GZbqi2sqbYjKfstRsQefKsXI4LKlTPDY6ONx1/QBd5KmeOw?=
 =?iso-8859-1?Q?uYao5ksBrhJiJqJstEmo3ULNLHzU16ZBN34TyXaQsL+zqqY28jMma2qIlE?=
 =?iso-8859-1?Q?o6Ee9q3Upr+ySKWFibJ7YhPOOvE402vrUH6Xe3R91iIPGIympwjd258A++?=
 =?iso-8859-1?Q?e/9HIEtv/Tw8pEDYG6mFYg4jnqO2y+W8U2tQKXeewrPBpk892WibkjySql?=
 =?iso-8859-1?Q?LSvkU9F6EqOV0Vt9qt9ndi716N9s8r9q35/4mk8j+xYbKEMOClfHnyHrxu?=
 =?iso-8859-1?Q?afRbkkl1xu7fpncptM5Y17/LcVavuo5PC4gk+xl2MeD/Oxe7zuZLxLPHnZ?=
 =?iso-8859-1?Q?rBq+vwdtheyMmn+aRyp+5jNhPAoCMrc8SlrBYCkvSf4G3Az6/nT9uS/Ohm?=
 =?iso-8859-1?Q?6bTC8HUdc8DVKnZVQSoLXdxcc9cdy8/b75iNorCHzPl2bWO9hFEw78AYJe?=
 =?iso-8859-1?Q?WEuoTPaSaFHi252qtvlzUXMHJ2fRISp3Ox2HXAU1Kb+ByGp9yAkNkkBtiz?=
 =?iso-8859-1?Q?zwX41LY+jZ/uZ/6NjBNZ++dlttlNgBQ9ib?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7142099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?Y+3GTyZbl/4MVnif0KadBKb8XlqV2EYZ12pBbR7CmR5IN+uZuGQlqUsLhA?=
 =?iso-8859-1?Q?s4UxO2VcR8h9ISTToRNZtL1JlW3BIItfdmMHps4BOhEOrWEta9pvMcAE02?=
 =?iso-8859-1?Q?xt0OvzpsFcFkqYDxdG9nSXdVD6nqp5oqm0hIU2O1JNOYgCc6UrZoJzW4Gc?=
 =?iso-8859-1?Q?vRJHdyERgfI3OzPd6gYXY/larBbTBtHZ+1meERxAnU2yWcTUcSmOLbLd7F?=
 =?iso-8859-1?Q?Lk4ntdXc05QD2uPpDOx2oH5zyh/0tbsO7dWP8QfnvGTupxTSsozi2HY4XS?=
 =?iso-8859-1?Q?y5y3IKgD5WalPkXmtkcrm03XP7DTefldVI0lMVZ+8JOTh7zs4nmpl5M7ra?=
 =?iso-8859-1?Q?YcNfSBvLtunHhPwlyn/5gowW71EJ0b4+mb3YPoEVpVoo1//iuZw/k2aHes?=
 =?iso-8859-1?Q?iJa9u+EfO/rgsXXgp0YNUqfRHEeSy6DnsF927oAsdiGBqnBzULkR4YnExP?=
 =?iso-8859-1?Q?HrQNnyJ2CaFVhZQ4kXWktA/7wWjOGX7N2um1y1/MaWFXE8JcYl29hWbcXp?=
 =?iso-8859-1?Q?Bl0eukwTIa7qh6I+qZHq4BnobpDSt3bEYUiamq/9AiNPBxd+U6Y+xomdWb?=
 =?iso-8859-1?Q?9HP+rbNRbSbxuOoYVbM62Iuq81swA95zCy1D9rYXtIKMDl3vhn1XRr5+dP?=
 =?iso-8859-1?Q?KRcleGidK5mRy1Vy+EWf/rg8o1rQFPJhZCypVSqJFgus5Q0zFTXaK+05rS?=
 =?iso-8859-1?Q?7GLpMZtn2knfF9uCH+Wl0B4xvyo8Mpb87/6n/2NX1nvpSbGLw8fxmU8P4L?=
 =?iso-8859-1?Q?0u5u/cEbMyCgpRanievSudSsPMLH96BkTd1FJiHMpDit7YlCzp2jMBz4kO?=
 =?iso-8859-1?Q?RsdviUnJsR/aBeZAL/zLTP9H33IUtcErZ2CNw212+0in7CsbC0FlXoiyFa?=
 =?iso-8859-1?Q?1hKcIXzoJT/HTIRay83ZtmBks6Wyfjr4rD+e/85kIKoOLyBTfHsBzaYOdG?=
 =?iso-8859-1?Q?jRFTdTHQdk5dx6cPISbSKUVlFDWN8bQE8Ok1gR8z6VYj2gaiiCA0Ddj+6m?=
 =?iso-8859-1?Q?TDGMjSHIbhQgKisJq8mhcstz7cA4OAuvKu0MQckF+3wyCheK4Jp8Aebnhg?=
 =?iso-8859-1?Q?FBx5pC+J7L27+XTEU87r/0pJSw5PcZTNjnkFuMSpS+DvpQxpwMv+WX9kyk?=
 =?iso-8859-1?Q?tNe52ihLHde8+1Cz5miwYX19VzMM+BBazrN/2SV9J6+i8d8k40UIjENT0+?=
 =?iso-8859-1?Q?eCDJfddBF0AcLfrGhGJrXWcjyLMICjGClDbOjP1aF7nOWJBf9rZ/SbX/8Z?=
 =?iso-8859-1?Q?9YGzLD7wTVrj4tNlxCoj9JlPuKRdPIY6lg1+Q8jPbHJTO2a694z+92tKhW?=
 =?iso-8859-1?Q?u1EKWR6N1Qd6oqbZ8IvHrow1PAdX27lElQJ373mtca8l7RbkNMXTZz0jSS?=
 =?iso-8859-1?Q?5RSYw+S/EdIr57WOVfda5eXe5IibkhF3/l/fHzfLOYCg3F7Dl5JC1HytIb?=
 =?iso-8859-1?Q?eIhB/SL/KB6I55Lb7S4C3A3ogjQBrbqa4oWkfSG9QA2VxNTM+GY+32yJmQ?=
 =?iso-8859-1?Q?mPwX5pLOb6yz/qXluZL9NKllN5n+AqObvg7PzfXyCjBfnAloTsFE/2eNAz?=
 =?iso-8859-1?Q?mtAJXdZ5TMSTKAKVlvUm77CRp1dzD2d1i6X7OVvHQ8hcJfX2ooD/G1YULh?=
 =?iso-8859-1?Q?3ITM8mIByUk5215CrD9KnG0xRYRbgYU+oLBF4Bqrj+SZzZqaQZbIOI14r1?=
 =?iso-8859-1?Q?HCXrWRSL/r/Db1iihwc2RPyu0xTySHfidpbq+6B9RWGYx7LYxxLe5YnWo/?=
 =?iso-8859-1?Q?0I94C/d4JFac4jbNwlICwGuELvXIya2cZwhhxh8eC8S1OCG8j2bh/KjUBB?=
 =?iso-8859-1?Q?1lxxuZcVww=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9AEiJgiEkvsvUC3MQMy8nOjpI+G2L1ix+u6eM8hrUHPzjBRSajzs+NcPDaOn5/iE/THSR5dti6DT+TfiJi8FVwLYEiCkz0IgBDgqi4k/khIUGIFDedlYZPPHoHWHo/jnOx9axRP/qOAV4PLXVMUNbBFNopBdYN+U7cF2TE6kvRyLGrL1hyBDDf3Y17QU9WJ4vEO1kE+wc3L9FfAPzx9zdY/npTOkoFPN2KaVrZurI/F834n7G6XLIpwOkp/rEbX+D+XCHTtGqOHM5wmpL94eVK1N3eu4YDXirVSd4JABBXJImuF0+p3dA+EA9hvxQhFHgxIiG8T1bael55KWyWfA3ySxUMbDWN57hy4zDkZcRUABs0UEAfok+qpeAEMTqgWc/JA/ZkufNwnnCGDFRyp0p8MyYpOMOJMbJcEZqZ8mDRCAXffeUJ7Xt8j8AVUV7i+eZEvDyBKrtxnRmcXe0ATOata+HdkJ/ILRn+EbC0b5EEQ9KDIRCiM3TncwZUJP1KQHmQKKwIDJV4E9r/R+sdY9D523z72n75j7Bxr22Q+xA0mzDoRVSLh3EGRMsBMitcx682Z5nj+69jHUoB9yTQWRzG65ZWIZBLNBIlHAwICljo4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c17a8a4-1321-4ed0-9325-08de63eed87c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 13:11:02.0607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /geGMt+DHyCnRXj6wKa8L2odro1hvYxyy7uOYteGELCIyo4bsDdw+SEffKAxle5NAU1ByVJLZD+TRYTFFQ2+W5mgrnlu0TVIQL8qCUKHVl8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7132
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_04,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2602040100
X-Authority-Analysis: v=2.4 cv=Jor8bc4C c=1 sm=1 tr=0 ts=6983456a b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=_oyxdor9yrro-BK6Pb4A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 cc=ntf awl=host:12103
X-Proofpoint-ORIG-GUID: EEBqzd5XtBassZpCX2m1yM82I98tb1lH
X-Proofpoint-GUID: EEBqzd5XtBassZpCX2m1yM82I98tb1lH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDEwMCBTYWx0ZWRfXxzFvn9mr9w/e
 twNsKYwMUv+SOsSrZOlp7sEmXsWw1CYd/jP60d7uwtGB39ed6Jt3mEMWry461Ag+1P1IDLOE8QX
 cymx2qMgz6ZmcMdGGlOgAaM1hJhzPtuvxHfVrY6KbUMiSdhCOux7Jck0Qql1SKTJOpEAlu6NYra
 yGWQFMGLb2172t8d5qfgvEJGiDU3rBAm94Y+bPpZcA9FrFeGeA6MGP9taAAbrcVSvYJpWNom4cF
 OKbE2VDHR8ZA28vfJHau9bU8BkQZcw5ooc+blTK4Tzp1ssq2baLObKSIRIjLjT1/t2SQ2ptjUCM
 REyX6jbP82MaRPLzlZwLfbAojbQMKL3qU4cBTUsHuFGzkUZnqPiEiGUurOD8mgp0HyNws4925+m
 lmAsB/S9WQscxRPsDRI3Akewwt663CDRbXzodU72vhSOyKalFz1JW1eFltRyjHTmhhVkmMMJo+b
 yW3KKorAmCzvabYREG9acEmvFvpRdTwGiBGn8xSE=

On Wed, Feb 04, 2026 at 01:25:03AM -0500, Eugene Loh wrote:
> Thanks.  The tests pass on all platforms I tried.
> 
> I did want to check something.  The subject line says both usdt and
> stapsdt.  The commit message talks of usdt.  The bug report indicts both
> usdt and stapsdt.
> 
> So, there is a problem with stapsdt;  the patch fixes and tests that.  That
> much is great.
> 
> However, the new multiloc usdt test seems to pass for me even without the
> fix.  So was there a usdt problem?  Is the multiloc usdt test good enough to
> show it?

The problem does not occur with regula USDT but there is also nothing that
actually tests for this, so I added it as a precaution for future regression.

> On 2/3/26 21:06, Kris Van Hees wrote:
> 
> > When a USDT probe has multiple call sites in the same function, only one
> > of the probe programs retrieves the argument values correctly.  The
> > probe argument data is collected for the first underlying probe, and then
> > skipped for any subsequent underlying probes.
> > 
> > Since it is not guaranteed that the argument description is identical for
> > all underlying probes (although it is almost always that way), we need to
> > process the argument description string for each underlying probe.
> > 
> > Orabug: 38922360
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   libdtrace/dt_pid.c                            |  9 ++-
> >   libdtrace/dt_prov_uprobe.c                    | 10 +--
> >   test/unittest/usdt/tst.multiloc.r             |  4 ++
> >   test/unittest/usdt/tst.multiloc.sh            | 69 +++++++++++++++++++
> >   .../usdt/tst.stapsdt-notes-bug38922360.r      |  4 ++
> >   .../usdt/tst.stapsdt-notes-bug38922360.sh     | 54 +++++++++++++++
> >   6 files changed, 140 insertions(+), 10 deletions(-)
> >   create mode 100644 test/unittest/usdt/tst.multiloc.r
> >   create mode 100755 test/unittest/usdt/tst.multiloc.sh
> >   create mode 100644 test/unittest/usdt/tst.stapsdt-notes-bug38922360.r
> >   create mode 100755 test/unittest/usdt/tst.stapsdt-notes-bug38922360.sh
> > 
> > diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
> > index 6f93123f..a379a0fe 100644
> > --- a/libdtrace/dt_pid.c
> > +++ b/libdtrace/dt_pid.c
> > @@ -1350,9 +1350,16 @@ dt_stapsdt_parse(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t *pdp,
> >   		if (strcmp(pdp->prb, "*") != 0 &&
> >   		    (strlen(pdp->prb) > 0 && strcmp(pdp->prb, prbname) != 0))
> >   			continue;
> > -		if (prb + strlen(prb) + 1 < dbuf + doff + nhdr.n_descsz)
> > +		if (prb + strlen(prb) + 1 < dbuf + doff + nhdr.n_descsz) {
> > +			char	*p;
> > +
> >   			psp.pps_sargv = prb + strlen(prb) + 1;
> > +			for (p = psp.pps_sargv; (p = strchr(p, '@')) != NULL;
> > +			     p++)
> > +				psp.pps_nargc++;
> > +		}
> > +
> >   		psp.pps_type = DTPPT_STAPSDT;
> >   		psp.pps_prv = prvname;
> >   		psp.pps_mod = mod;
> > diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> > index 6d1c0f65..e575b072 100644
> > --- a/libdtrace/dt_prov_uprobe.c
> > +++ b/libdtrace/dt_prov_uprobe.c
> > @@ -1659,15 +1659,7 @@ static int probe_info_stap(dtrace_hdl_t *dtp, const dt_probe_t *prp,
> >   	if (!upp || upp->sargv == NULL)
> >   		goto done;
> > -	/* First count the arguments. */
> > -	for (p = upp->sargv; p != NULL; argc++) {
> > -		p = strchr(p, '@');
> > -		if (p++ == NULL)
> > -			break;
> > -	}
> > -
> > -	/* Record number of arguments, and allocate descriptors. */
> > -	upp->sargc = argc;
> > +	argc = upp->sargc;
> >   	if (argc == 0)
> >   		goto done;
> > diff --git a/test/unittest/usdt/tst.multiloc.r b/test/unittest/usdt/tst.multiloc.r
> > new file mode 100644
> > index 00000000..a0bbc7a8
> > --- /dev/null
> > +++ b/test/unittest/usdt/tst.multiloc.r
> > @@ -0,0 +1,4 @@
> > +main
> > +test:main:args main
> > +test:main:args main
> > +
> > diff --git a/test/unittest/usdt/tst.multiloc.sh b/test/unittest/usdt/tst.multiloc.sh
> > new file mode 100755
> > index 00000000..19d5d6c1
> > --- /dev/null
> > +++ b/test/unittest/usdt/tst.multiloc.sh
> > @@ -0,0 +1,69 @@
> > +#!/bin/bash
> > +#
> > +# Oracle Linux DTrace.
> > +# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> > +# Licensed under the Universal Permissive License v 1.0 as shown at
> > +# http://oss.oracle.com/licenses/upl.
> > +
> > +# This test covers USDT probes firing from multiple locations in the same
> > +# function, verifying that argument data is correct.
> > +
> > +if [ $# != 1 ]; then
> > +	echo expected one argument: '<'dtrace-path'>'
> > +	exit 2
> > +fi
> > +
> > +dtrace=$1
> > +CFLAGS="-std=gnu89 $test_cppflags"
> > +LDFLAGS="$test_ldflags"
> > +
> > +DIRNAME="$tmpdir/usdt-multiloc.$$.$RANDOM"
> > +mkdir -p $DIRNAME
> > +cd $DIRNAME
> > +
> > +cat > test.c <<EOF
> > +#include <sys/sdt.h>
> > +#include <stdio.h>
> > +
> > +int
> > +main(int argc, char **argv)
> > +{
> > +	printf("%s\n", __func__);
> > +	DTRACE_PROBE1(test_prov, args, __func__);
> > +	DTRACE_PROBE1(test_prov, args, __func__);
> > +}
> > +EOF
> > +
> > +cat > prov.d <<EOF
> > +provider test_prov {
> > +	probe args(char *);
> > +};
> > +EOF
> > +
> > +${CC} ${CFLAGS} -c test.c
> > +if [ $? -ne 0 ]; then
> > +	echo "failed to compile test.c" >& 2
> > +	exit 1
> > +fi
> > +$dtrace $dt_flags -G -s prov.d test.o
> > +if [ $? -ne 0 ]; then
> > +	echo "failed to create DOF" >& 2
> > +	exit 1
> > +fi
> > +${CC} ${LDFLAGS} -o test test.o prov.o
> > +if [ $? -ne 0 ]; then
> > +	echo "failed to link final executable" >& 2
> > +	exit 1
> > +fi
> > +
> > +$dtrace $dt_flags -c './test arg1val' -qs /dev/stdin <<EOF
> > +test_prov\$target:::args
> > +{
> > +	printf("%s:%s:%s %s\n", probemod, probefunc, probename,
> > +	       copyinstr(arg0));
> > +}
> > +
> > +EOF
> > +status=$?
> > +
> > +exit $status
> > diff --git a/test/unittest/usdt/tst.stapsdt-notes-bug38922360.r b/test/unittest/usdt/tst.stapsdt-notes-bug38922360.r
> > new file mode 100644
> > index 00000000..a0bbc7a8
> > --- /dev/null
> > +++ b/test/unittest/usdt/tst.stapsdt-notes-bug38922360.r
> > @@ -0,0 +1,4 @@
> > +main
> > +test:main:args main
> > +test:main:args main
> > +
> > diff --git a/test/unittest/usdt/tst.stapsdt-notes-bug38922360.sh b/test/unittest/usdt/tst.stapsdt-notes-bug38922360.sh
> > new file mode 100755
> > index 00000000..ea0d6880
> > --- /dev/null
> > +++ b/test/unittest/usdt/tst.stapsdt-notes-bug38922360.sh
> > @@ -0,0 +1,54 @@
> > +#!/bin/bash
> > +#
> > +# Oracle Linux DTrace.
> > +# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> > +# Licensed under the Universal Permissive License v 1.0 as shown at
> > +# http://oss.oracle.com/licenses/upl.
> > +
> > +# This test covers stapsdt probes fired by the STAP_PROBEn macros, verifying
> > +# that argument data is processed correctly when the same probe is used in
> > +# multiple locations.
> > +
> > +if [ $# != 1 ]; then
> > +	echo expected one argument: '<'dtrace-path'>'
> > +	exit 2
> > +fi
> > +
> > +dtrace=$1
> > +CFLAGS="-std=gnu89 -I${PWD}/test/unittest/usdt $test_cppflags"
> > +LDFLAGS="$test_ldflags"
> > +
> > +DIRNAME="$tmpdir/usdt-notes-bug38922360.$$.$RANDOM"
> > +mkdir -p $DIRNAME
> > +cd $DIRNAME
> > +
> > +cat > test.c <<EOF
> > +#include <sdt_notes.h>
> > +#include <stdio.h>
> > +
> > +int
> > +main(int argc, char **argv)
> > +{
> > +	printf("%s\n", __func__);
> > +	STAP_PROBE1(test_prov, args, __func__);
> > +	STAP_PROBE1(test_prov, args, __func__);
> > +}
> > +EOF
> > +
> > +${CC} ${CFLAGS} -o test test.c
> > +if [ $? -ne 0 ]; then
> > +	echo "failed to compile test.c" >& 2
> > +	exit 1
> > +fi
> > +
> > +$dtrace -c './test arg1val' -qs /dev/stdin <<EOF
> > +test_prov\$target:::args
> > +{
> > +	printf("%s:%s:%s %s\n", probemod, probefunc, probename,
> > +	       copyinstr(arg0));
> > +}
> > +
> > +EOF
> > +status=$?
> > +
> > +exit $status
