Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7375617BA2
	for <dtrace@lists.linux.dev>; Tue,  3 Feb 2026 20:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770149063; cv=fail; b=hc/bICMDp9b3uXVzajkjGP/HVdSEMWx21c77Q0WyxGCRdpwEeVdgN3NWc18+iIwUIwwZ53SBMj4UOCBiBVuS3k7riAwJVGBlwhKYHZnv09MElFXZzUjWrQAs5YAJRcb/9V6sDX2KvROwP1Ya31u2UnGXL2B5BFZ+m5fqB2Z4HP4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770149063; c=relaxed/simple;
	bh=zCUB21WVWmfhi7yzgdptC7vh/K/qZSpGXsgU711yL90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NCxpq7fMc1zOIFK37ZXj49dK6OWmLBX+RBdZVT4VS4MXqIyEF7spXPdGSRslFIHqMkrCt5uEYx1CnTMWZQ/WYP3iDF3ApLo51CI9IVjs2aX4YSGNOeeUWnEqFT4JjYV/rWjtN+o7HCSeiGey9WYTPuuhsp3vJJJqBEnPxMaTamU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=k4yc14MS; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gulav8nx reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="k4yc14MS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gulav8nx"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613IuDBt1423442
	for <dtrace@lists.linux.dev>; Tue, 3 Feb 2026 20:04:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=O2SpEXyYYdrVW+1JG9Hh1rmzWDkQNbfh12wB1OY4DYo=; b=
	k4yc14MSkHzmzajfu+9J6xu4MnUkpvvd1qX94QltJfBOrRiSth/q3sdaGfBXUc1b
	uCKZfFnOmTrPqcOp9c3IIzENIoOagmf0sU62vTFGJYOxf7aKO23Q3t3W6qJoIbII
	YhuER+Zi6oySdSv1PaGPfBaTdfIxAWl+MQEL9b7O0kXJoAbEzQpP30dHROYiU5xj
	rNB/nmVocxs8yu4XBrGFx4mMAHVhD7PX2PFLrDH6sM8vAwFBeX+fE5APAbJcnpp3
	kxNG9O6hyepBbvTMrjk3qVyHeaF+OEWSh4Mmbf0qPlR+w0LrJGDVQgjrBb/TzDGl
	FExMt+2X513a9o+Mu/FNKw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c3jsqgngu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Feb 2026 20:04:20 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 613Jko9Z023921
	for <dtrace@lists.linux.dev>; Tue, 3 Feb 2026 20:04:19 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012051.outbound.protection.outlook.com [52.101.48.51])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4c186abfr3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Feb 2026 20:04:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=snWfM5L5klZSHqj8h8U/Tx2MjbB5VxhRf9RO7LxlgDEGl4TEQzr4HkznzmiY5oodo/RWnE6FzJMnkkjSUhe6rNbg56LqJGmU4ZHLv+BX2UdEgYM1vDgW02lIp4L9mN8LMqZyIZKtTAiHz3kbEwhdgVFpyf+8Qn+vNVt5ZZf+eOROamJiT3m2iu3zZYzeaOxNTStGWcbg/ODnowzXEagGbiezl6L+iKiheH6wx6gRYeX2SG8oOMGaEhlSi8eQ7A9b7VvLKBp9e+Kp9P4MVz3iP/3LMCCrVQb7cGjQUqU0AJIW2gKWxCPNmgNUkdRZozRBmJ8CFFKRHkvNbQ/9NI9iSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tx9Qhkj6clPun9BBo67uBdSQ/teZMITjaReqevnKf+U=;
 b=ckHwOUUZmiHu2ob0HYyftd45xbGJBTDjq8TtHbvrDOs3IPU6HS26nXa+NZ1+gT9E7A9OSK87D0gCMenug/uUbF7Rk3qZNtgqgK8FjVrj9PthXYXVCy5AN55tLQ6ZMGTL+dzq3ilB7xrsYR04h6uaHK5iL5bScsP7pHOBlWh61dtoWfYSlpOnVaHAlL6SSu2SZIzNv4dAOvaSZjw+st22gAfLjjheHonwEO+ROHHOikYRPjaYvK6oNx1+wjKeN9naMFx4DlC5+pTGd9XVPiz+8coKS6lBm2aCGBzMu+k22IZ3iwF/JvM2NdmqHg2NHareEjCgeT8+7WNa0DE333o4mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tx9Qhkj6clPun9BBo67uBdSQ/teZMITjaReqevnKf+U=;
 b=gulav8nxL+d5WONNxe6Fpq8h5yYUFHJJcT5awzHr2Ve8GAIUhOrq92RPRiwMDWSliclOj9Czt/4nxcK7hMtgXR9mEd5J3tG4lFrRoUFef38gQUcnHNirliMZ0z3kyklkenf2v6ZdzHpR6HogEtFKKuk44JnTF9UPDN1frImChsw=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by PH7PR10MB7730.namprd10.prod.outlook.com (2603:10b6:510:308::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 20:04:13 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9587.010; Tue, 3 Feb 2026
 20:04:13 +0000
Date: Tue, 3 Feb 2026 15:04:10 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH] syscall: fix syscall probe argument
 handling
Message-ID: <aYJUusPpjNB85ZEP@kvh-deb-bpf.us.oracle.com>
References: <DS0PR10MB7522673147BF87561EFF9A68C29BA@DS0PR10MB7522.namprd10.prod.outlook.com>
 <e3696840-024a-9a83-7baf-bf3b3a4faeda@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e3696840-024a-9a83-7baf-bf3b3a4faeda@oracle.com>
X-ClientProxiedBy: PH8PR07CA0012.namprd07.prod.outlook.com
 (2603:10b6:510:2cd::6) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|PH7PR10MB7730:EE_
X-MS-Office365-Filtering-Correlation-Id: 9288adf7-5da1-415d-e48b-08de635f66e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?AtttE8eEkQTlCmfxsIPiQMmf7FtUfTK2Oj96xvCQmUGR/pMUvokuQsDGwH?=
 =?iso-8859-1?Q?X8XB9xz2ydpxUOFNkFLMHr8q7Doa/wn+XNeIk+WQ7FDWfw1W3JJX+kUYiD?=
 =?iso-8859-1?Q?GhRRP3oV4z8n+wR0UOuUu4iREDE7e1BjlXcopKx+pmrFTBVz+nxr7OGcjf?=
 =?iso-8859-1?Q?J3vul+9CZZiDk0HKbFUEKaSBUOLXJh2M4dcCT08CSWZpp0don3YGgWJqdR?=
 =?iso-8859-1?Q?gybdCBDdkBJLxkyZmKIgG9qYtGrfvawQWV8iUjyqVCYSB8x5wgP3xT5BBd?=
 =?iso-8859-1?Q?nprQb6qNZO9py1qi3mRt0W53gFSgl1Omqvkq7ALoPsVcQfYf0f6HB/0mte?=
 =?iso-8859-1?Q?TFETRlb76RN9Ei4I5Z3G5zkKJDrATjcgT9GNHbZ1f9fVXBkqs/uecsOSBc?=
 =?iso-8859-1?Q?X9lsi3SPZAvmrwfIjD9i3jPYxkCCOZR2bafhPD4739KUXN1Zy7ITFKXYCR?=
 =?iso-8859-1?Q?VOu5Rp9wCqbhCAtm9AJIXTAoQBV8+IGH6LyadStZoh2Y799X9xixDsbpfB?=
 =?iso-8859-1?Q?+5YXQtzzdy5ZEtobmR0hztFUZupGS6gxTz/z0Kl+xsAh48azGO/hg/4KLp?=
 =?iso-8859-1?Q?KVvYmnLnR/j8x9hdt51GWca161CkVnbo09ZAJDM28LDJnJyvQIAdknLVO5?=
 =?iso-8859-1?Q?7/k/dAe/oZXDwx0DIFGmp8VunebWnYFQNR6Z4+DR5n/orVvec9pL/TQd5f?=
 =?iso-8859-1?Q?bxOJfP13cJALNp9OlZgQ66UOz7gyytpVpxlSVcAOjN7qBZixXThreJ2Wp2?=
 =?iso-8859-1?Q?z4Y5q4GVGmMlCrPgIJO1V7xWsN98MmncFYtSBVj4Lf8rlKg6674DUvyL69?=
 =?iso-8859-1?Q?KUyqVqlxcDfRRTMzt2ufLF4cCZt3QniIC2rZJiNGJSio6Vrself4O2qmka?=
 =?iso-8859-1?Q?pkJzPhxOJ83Bc9xm2v4nlywp1o6YBN/wIoRPpvlXsRtgGEhgs2x1emNOu9?=
 =?iso-8859-1?Q?v/pmMQPGeBogiAV1Zrqti1TsqfFv0sFjZF3Wn8wDuVwCGGBCBEQPaHRTQR?=
 =?iso-8859-1?Q?ZAXAXTsLoSwm1IUVPsK7/bmviqNLeKoTT19/KO8O+59GjMyS7V3OS0Qtui?=
 =?iso-8859-1?Q?BZ55vDUxKsUOCauKK46mEn1QuQCDUBlwv6a6769Ce6Sru0IumIVspjhs3v?=
 =?iso-8859-1?Q?kyLhkNFzi+iWrjFj2/FKY0gfvEKXBnzFrY4mQXs3ECh+anVrPndrw9zwk7?=
 =?iso-8859-1?Q?JnHd8w8qrWSzL2LJdk8UFb7cTj/kOqyrH7Tr+dZgX2H/uKi2ucanPoiJjG?=
 =?iso-8859-1?Q?5aY2rT16Mzj7vdtlii44gZq3+WM15CQOChAohYeUAiX7x5T3mnsB1l02wA?=
 =?iso-8859-1?Q?wgNIum7oVizn58QTkZM5IiBbWueLk2IXkGAvHE4Ze2xaDseW6emtc8p54X?=
 =?iso-8859-1?Q?hAG+auAMSiAFFUS/BDCl754M3rRg3d7cj1+zQlI9kG7ezhDC6sQx/+Lrz+?=
 =?iso-8859-1?Q?t5QeTR6QOSq9dO1CTgp60HcK4x/6Ty5KGprh59LYfIXZDhUu5HlwkER8bg?=
 =?iso-8859-1?Q?3QWB7BwVzEAxhPwCTzpWQpfmufY+SHFtWqoe/1Ox+ZWy1q/E/kyxBulDPQ?=
 =?iso-8859-1?Q?dngjm9VHAtNop0eGVOM5aTPEflYRMtQSjqoukNATMxtg1xtd9Havc0cjJ5?=
 =?iso-8859-1?Q?VYfVG0nQW5KMo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?hbNUl1OADRHUuk+P1shoPb26mRycZQlzo+CZn9V39vP8MxIiZkOgavH7UR?=
 =?iso-8859-1?Q?T6gxYMoZFGRDd4nTU4RKUuXtPIF5O627UUKsOunDjhpjuj4nEwaVDCkxPG?=
 =?iso-8859-1?Q?t6iX16QFFXEjISYPpo+p7M4K+DIwu4n7pBeB5GFSQmZntEujq6j2Yg4uve?=
 =?iso-8859-1?Q?/Ig1FytFiyo7Nnt+ywU5btbiDyXuOzI6DYosxdla9PYjf/oiHMFrZfa5Ew?=
 =?iso-8859-1?Q?8AanGH3YPUIVlGjn3fGYD6UdiZrt6TSkvx+RH3XRwVUjTplhXnRpQ+F3GU?=
 =?iso-8859-1?Q?agG18W8i3E+ZysPki+lInARpxTQReROUFcAtWtCYucGsXOm6kueyuhj68M?=
 =?iso-8859-1?Q?uDvCkvw01vnc62vJlegC26UP3tnsK5lj05HvRW7eqPscxSahIF8HlegU79?=
 =?iso-8859-1?Q?Slq0YbgdFRyxAePyW+IgpE+piR5jyeQK8o+9cM79sZL7fY+zCLp2rFL6bn?=
 =?iso-8859-1?Q?anciIRDdMCzJi67Tl3lDzvveJkYXAvGDKXeYQvxKZDDnloShzK1i9lNszf?=
 =?iso-8859-1?Q?IP3wMjv9j9v1ky5DaZqoUAcV0c2sNt0+2JbRlpzCMxl8qN964JkXj2m363?=
 =?iso-8859-1?Q?BDXfNTF+ByHopu+BhPWq0dz27tnxKuVwTAdJ+TXQ32SNW+iO3V/S6Hb17s?=
 =?iso-8859-1?Q?86dSxhLbnM5Zil8RjCaHc/O5hh7YRoUxdzMYU+Y8e4kehfp8VUU4AuEqrF?=
 =?iso-8859-1?Q?/RcC8Ofb3Qw9DyB8U+dfxAvKuI1wt2t/+aVGfUOpW7ZVjjuOuX5Bv6aJin?=
 =?iso-8859-1?Q?BN3q4xC19UjwwRTRvBGX2ByJEUgSZNW9Kmt6W79YHUNZR/5Dxk5QHSwX1w?=
 =?iso-8859-1?Q?LuhiBYhh8xwoVv7Zt0brLmSuXpRQbTf8FSVnYrkiwCRYGuO2qoH6/h4rOG?=
 =?iso-8859-1?Q?lQJVLKYbYPQiTWZzuU9NSWeQKj3aJWwJGJ4rjgoD3mUU7wf+gxph3M1DQM?=
 =?iso-8859-1?Q?ozX8pVerP5yFhMVQnTQsrIfdsSQ1EMpP4uW5sKLWLFwRyErXhbWB5Pmajv?=
 =?iso-8859-1?Q?+QDhAFb+wBDzjuWk6RtthVy6mrm6eTDEiqhpdh8PAUM+VRYGpydU4g0C1k?=
 =?iso-8859-1?Q?PlLdfZbW/+0k9rsdP8WfOY/zGAlbHTgbPFOXV0Sp5Tf74eekruopq65f6q?=
 =?iso-8859-1?Q?KIOhpVfMRJ6xybWjWnlMbTwPw8WzIhWF3LKwEWSJXM6gZFFo9k5NnU1rfm?=
 =?iso-8859-1?Q?/mdKJEaFYHdAupmXK6I47ASAa8DsnrjW3WBWVEE1iUkkc4SRH5QHSpfCRm?=
 =?iso-8859-1?Q?SQl1hTtykWuoGpzFyuH+3s+A1fBPv+ZqyQ7RNt5qVlj8d2dizF6f4N1rTZ?=
 =?iso-8859-1?Q?iSl2QezBhVwYsfVK9IUemrOTPRFLPO5A551sABp8bxTI2D7m9yS4xQi6ux?=
 =?iso-8859-1?Q?mJuac4MbIgiXT0vVffsdK4Ydk7nje30uZg+n2yipsO5Dpmz1MEQEUmfnlr?=
 =?iso-8859-1?Q?q4yT7L4ZtwWshheiYZQ8l0e9kKxgEGcnM9bJiWPdkQZ+pkxxpsm0UbPc0v?=
 =?iso-8859-1?Q?BJ71GRjwH+sIDgzFSR9W1LBxdyB0sdqdXhTte0/Qaa/11W2D4+y9aHAPdo?=
 =?iso-8859-1?Q?YWbJahiAhVoeiVmNEllbICiT4KEiRCSRN5PabatTmW9tSPwjbaS6jVtP5a?=
 =?iso-8859-1?Q?g0yDWGWSNglhwvNq3vv3dBtiYpgDVBGpz32li8LZgW+0/OuBo6k1ULcQgk?=
 =?iso-8859-1?Q?AGu9iZoV+sKnEsTJaf12UQZKV9FcNhs4AC240+UGingSEBiDJBsrjbZ3Ok?=
 =?iso-8859-1?Q?SzWyPjPqo9II2wAZ/v2mCY0O/HpDxrrAS4wIr+abmv1pqYRQS1In7K36Ep?=
 =?iso-8859-1?Q?tQGOuuuk96ro91G5TiyO5rAYomD8cxU=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rf7fNs1G0+9Z7PyUUL2HHh9bLz4wOV/mYPypfnBcrKzk4hqAVg+aQqbewT3DCmV11cW54uOjD/mOa6CvhI/UHfHRBuDbQgP86N2ODjJSwrKAmcizro8xS3pnKCA2AUi4pL8DGW+gbCj3yiU74TgB+lXBsxTaOHHUPD7hEVTnzNDV5oVH7AlB15ZAxNzdvyOX3BfBx7vxHRMPe8aH32NhSZAFZRtPsadGBk0AxmaX++Fj2/KTeGCKa4ahlI4/9fiyOPK2h2lHOvugJmH3WjlGXuZxWck7+Ge7lbwLd28UqopdUpYSndWkutZUEqxIabt1Tya+urU9dP+u7f6GD5PJ/QL+4luMXZKVhGqofjs/XPC0wVS4UbYssVD+Ey8QwV+4ep5mCXYmsQP8ohQa4D39l+53n08WEURjXmjDQ6/K9TfeAMSz14RHlOPEgobDzCie8eE4PXILU7aedXNU+eC3Gf4yxfrq1JlMr1m97r9LgwgsSm/YcO73SZh7tgIj0X3eQKYMcJ7w20vtQOsvEj7IZEbCPkop1AebtkDo7lNkfNJeH3izWjJzTmbQFXCj+r674OqPZK/yKAVutuwGBuAxESaGEkLhYif3TVQgf45M9Ak=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9288adf7-5da1-415d-e48b-08de635f66e7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 20:04:13.3933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cZZYu14YPtVTyhYu8JWpc9gjZjxwmLpYTm14ZQMF1h6y2gLFKlSxAKG/c3WNWLmWNDkY7j9N9usohqzGXplYXT1Rl0mC2abRPEhR3kCu+1g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7730
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_06,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 adultscore=0 suspectscore=0 mlxscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2602030159
X-Authority-Analysis: v=2.4 cv=Db0aa/tW c=1 sm=1 tr=0 ts=698254c4 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=6KnKBFJS5OLqP9ADdLoA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-ORIG-GUID: nKw03MR84dWQWbv_USlL9gUofNlpnoI9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDE1OSBTYWx0ZWRfX9X/98iT4078C
 RaLsOz4MRdT7KTKHejyOCr6gzZn3546pRGT4Iw2AqY+T2Wx6grhM5x46r+dGzISk5f16L8RBuJI
 luDabxTLx5xtepSD3ub/rrj9wrjrCnR2bUAou5tkHnf/Qg3l/h6NPbi6sQR7aoBHsnsUG3ubmVR
 NVVZSsO8kQ3GcOjMLr93Fdnv2qqgy6HV2aFj81Z3ikjwZej4AJNEbqZeq+S6X7jX6572HVhpoI1
 TjOTRzWbAj20w449PZX1D2BNLQtmmUcL0Sxtn3BBlWjmtDdpEv3Eb4H7YRUFzcXlz32nObAQ7DR
 UxXgMOLuLiavXl6fxkuZwM0imdOl1JMH4EAvuvl/xJKPipnI5QHeEjVfXE0E22rXyr+oWBRg5Qp
 hNrUhzEZVLJi6XTIuZyblssQzFQMk0zE2pSIeQbfr0+0uElax0CvPn4T61QXawRCncW1WB1LAHx
 ixRojQNOyP4NhAxk5mA==
X-Proofpoint-GUID: nKw03MR84dWQWbv_USlL9gUofNlpnoI9

On Tue, Feb 03, 2026 at 02:53:03PM -0500, Eugene Loh wrote:
> I'm probably good with this patch but just wanted to ask/say a few tiny
> things:
> 
> *)  What is the testing situation?  Is there a major outage of tests with
> 6.19 kernels?

Yes, this broke pretty much any syscall test for syscalls with a char * arg.

> *)  In valid_arg(), s/cmmon/common/.

Thanks.

> *)  In valid_arg(), why is there a fldc arg?  If what we're trying to do is
> skip __syscall_nr, why not check strcmp(desc,"__syscall_nr")==0?  I suppose
> that's a more expensive check, but it's more precise?

Sure, I can do that.  I was going by the notion that the provider has knowledge
about the tracing infrastructure (which it has to), so we *know* for certain
that we need to skip the first field we are presented with, regardless of
whether they might change the name.  So, I think that using the field count is
actually fine.

> On 2/3/26 11:23, Kris Van Hees via DTrace-devel wrote:
> > Kernel commit a544d9a66bdf
> > ("tracing: Have syscall trace events read user space string") (added in
> > 6.19-rc1) causes special fields to be added to the tracepoint format
> > file for data strings that are faulted in.  We need to account for this
> > when determining the number of arguments for syscall tracepoints.
> > 
> > We introduce support for a valid_arg() callback function that providers
> > can implement to support skipping initial non-common fields and also to
> > stop processing fields as arguments.  The syscall provider uses this to
> > skip the __syscall_nr field, and to stop argument processing when the
> > first dynamic string field is found.
> > 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   libdtrace/dt_prov_dtrace.c  |  2 +-
> >   libdtrace/dt_prov_fbt.c     |  2 +-
> >   libdtrace/dt_prov_sdt.c     |  2 +-
> >   libdtrace/dt_prov_syscall.c | 42 +++++++++++++++++++++----
> >   libdtrace/dt_provider_tp.c  | 63 +++++++++++++++++++++++++------------
> >   libdtrace/dt_provider_tp.h  | 11 +++++--
> >   6 files changed, 90 insertions(+), 32 deletions(-)
> > 
> > diff --git a/libdtrace/dt_prov_dtrace.c b/libdtrace/dt_prov_dtrace.c
> > index 9ef001a3..a0bf34c3 100644
> > --- a/libdtrace/dt_prov_dtrace.c
> > +++ b/libdtrace/dt_prov_dtrace.c
> > @@ -255,7 +255,7 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
> >   		if (f == NULL)
> >   			return -ENOENT;
> > -		rc = dt_tp_probe_info(dtp, f, 0, prp, NULL, NULL);
> > +		rc = dt_tp_probe_info(dtp, f, NULL, prp, NULL, NULL);
> >   		fclose(f);
> >   		if (rc < 0)
> > diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
> > index ed1bd93d..59e4583b 100644
> > --- a/libdtrace/dt_prov_fbt.c
> > +++ b/libdtrace/dt_prov_fbt.c
> > @@ -526,7 +526,7 @@ static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
> >   			goto out;
> >   		/* read event id from format file */
> > -		rc = dt_tp_probe_info(dtp, f, 0, prp, NULL, NULL);
> > +		rc = dt_tp_probe_info(dtp, f, NULL, prp, NULL, NULL);
> >   		fclose(f);
> >   		if (rc < 0)
> > diff --git a/libdtrace/dt_prov_sdt.c b/libdtrace/dt_prov_sdt.c
> > index f9de2cf8..b1343481 100644
> > --- a/libdtrace/dt_prov_sdt.c
> > +++ b/libdtrace/dt_prov_sdt.c
> > @@ -202,7 +202,7 @@ static int probe_info_tracefs(dtrace_hdl_t *dtp, const dt_probe_t *prp,
> >   	if (!f)
> >   		return -ENOENT;
> > -	rc = dt_tp_probe_info(dtp, f, 0, prp, argcp, argvp);
> > +	rc = dt_tp_probe_info(dtp, f, NULL, prp, argcp, argvp);
> >   	fclose(f);
> >   	return rc;
> > diff --git a/libdtrace/dt_prov_syscall.c b/libdtrace/dt_prov_syscall.c
> > index 4f1e206a..e80c7bcb 100644
> > --- a/libdtrace/dt_prov_syscall.c
> > +++ b/libdtrace/dt_prov_syscall.c
> > @@ -40,11 +40,6 @@ static const char		modname[] = "vmlinux";
> >   #define SYSCALLSFS		EVENTSFS "syscalls/"
> > -/*
> > - * We need to skip over an extra field: __syscall_nr.
> > - */
> > -#define SKIP_EXTRA_FIELDS	1
> > -
> >   static const dtrace_pattr_t	pattr = {
> >   { DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_COMMON },
> >   { DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
> > @@ -186,6 +181,41 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
> >   	return 0;
> >   }
> > +static int valid_arg(int fldc, const char *desc)
> > +{
> > +	char	*p, *q;
> > +	int	rc = 1;
> > +	size_t	l;
> > +
> > +	/* Skip the first non-cmmon field (__syscall_nr). */
> > +	if (fldc < 1)
> > +		return 0;
> > +
> > +	/*
> > +	 * A non-common field with a __data_loc tag and __<name>_val name
> > +	 * indicates the beginning of the dynamic data area.  The previously
> > +	 * processed field was the last argument.
> > +	 */
> > +	p = strdup(desc);
> > +	if (sscanf(p, "__data_loc %[^;]", p) <= 0)
> > +		goto ok;
> > +
> > +	l = strlen(p);
> > +	if (l < 4 || strcmp(&(p[l - 4]), "_val") != 0)
> > +		goto ok;
> > +
> > +	q = strrchr(p, ' ');
> > +	if (q == NULL || strncmp(q, " __", 3) != 0)
> > +		goto ok;
> > +
> > +	/* Done with processing fields. */
> > +	rc = -1;
> > +
> > +ok:
> > +	free(p);
> > +	return rc;
> > +}
> > +
> >   static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
> >   		      int *argcp, dt_argdesc_t **argvp)
> >   {
> > @@ -209,7 +239,7 @@ static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
> >   	if (!f)
> >   		return -ENOENT;
> > -	rc = dt_tp_probe_info(dtp, f, SKIP_EXTRA_FIELDS, prp, argcp, argvp);
> > +	rc = dt_tp_probe_info(dtp, f, valid_arg, prp, argcp, argvp);
> >   	fclose(f);
> >   	return rc;
> > diff --git a/libdtrace/dt_provider_tp.c b/libdtrace/dt_provider_tp.c
> > index 1faf5cd4..6e0d908a 100644
> > --- a/libdtrace/dt_provider_tp.c
> > +++ b/libdtrace/dt_provider_tp.c
> > @@ -123,17 +123,16 @@ dt_tp_attach_raw(dtrace_hdl_t *dtp, tp_probe_t *tpp, const char *name,
> >    * array dimension specifiers (and those are part of the type).
> >    *
> >    * All events include a number of common fields that we are not interested
> > - * in and that need to be skipped.  Callers of this function can specify an
> > - * additional number of fields to skip (using the 'skip' parameter) before
> > - * we get to the actual arguments.
> > + * in and that need to be skipped.  Callers of this function can specify a
> > + * callback function (valid_arg) to validate a non-common field.
> >    */
> >   int
> > -dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
> > -		 int *argcp, dt_argdesc_t **argvp)
> > +dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, dt_valid_arg_f *valid_arg,
> > +		 tp_probe_t *tpp, int *argcp, dt_argdesc_t **argvp)
> >   {
> >   	char		*buf = NULL;
> >   	size_t		bufsz;
> > -	int		argc, common = 1;
> > +	int		idx = 0, argc = 0, skip = 0, common = 1;
> >   	dt_argdesc_t	*argv = NULL;
> >   	tpp->id = 0;
> > @@ -141,10 +140,8 @@ dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
> >   	/*
> >   	 * Pass 1:
> >   	 * Determine the event id and the number of arguments.
> > -	 * Skip over how ever many arguments the caller asks us to skip.
> > -	 * We will skip initial "common fields" as well.
> > +	 * We will skip initial "common fields".
> >   	 */
> > -	argc = -skip;
> >   	while (getline(&buf, &bufsz, f) >= 0) {
> >   		char	*p = buf;
> > @@ -205,7 +202,31 @@ dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
> >   			common = 0;
> >   		}
> > -		/* We found a non-common "field:" description. */
> > +		/*
> > +		 * We found a non-common "field:" description.
> > +		 *
> > +		 * If the caller provided a validation hook, call it with the
> > +		 * current non-common field counter and the description text.
> > +		 * The hook returns
> > +		 *  -1 if the field is not a valid argument, and no additional
> > +		 *       arguments can follow
> > +		 *   0 if the field should be skipped
> > +		 *   1 if the field is a valid argument
> > +		 */
> > +		idx++;
> > +		if (valid_arg != NULL) {
> > +			int	rc = valid_arg(idx - 1, p);
> > +
> > +			if (rc == -1)
> > +				break;
> > +			if (rc == 0) {
> > +				skip++;
> > +				continue;
> > +			}
> > +		}
> > +
> > +		sscanf(p, "__data_loc %[^;]", p);
> > +
> >   		argc++;
> >   	}
> >   	free(buf);
> > @@ -232,7 +253,7 @@ dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
> >   	 * Fill in the actual argument datatype strings.
> >   	 */
> >   	rewind(f);
> > -	argc = -skip;
> > +	idx = -skip;
> >   	while (getline(&buf, &bufsz, f) >= 0) {
> >   		char	*p;
> >   		size_t	l;
> > @@ -249,7 +270,7 @@ dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
> >   			continue;
> >   		/* We found a field: description - see if we should skip it. */
> > -		if (argc < 0)
> > +		if (idx < 0)
> >   			goto skip;
> >   		sscanf(p, "__data_loc %[^;]", p);
> > @@ -320,13 +341,15 @@ dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
> >   			}
> >   		}
> > -		argv[argc].mapping = argc;
> > -		argv[argc].flags = 0;
> > -		argv[argc].native = strdup(strp);
> > -		argv[argc].xlate = NULL;
> > +		argv[idx].mapping = idx;
> > +		argv[idx].flags = 0;
> > +		argv[idx].native = strdup(strp);
> > +		argv[idx].xlate = NULL;
> >   skip:
> > -		argc++;
> > +		idx++;
> > +		if (idx == argc)
> > +			break;
> >   	}
> >   done:
> > @@ -413,12 +436,12 @@ dt_tp_probe_insert(dtrace_hdl_t *dtp, dt_provider_t *prov, const char *prv,
> >    * the argument types for a given probe.
> >    */
> >   int
> > -dt_tp_probe_info(dtrace_hdl_t *dtp, FILE *f, int skip, const dt_probe_t *prp,
> > -		 int *argcp, dt_argdesc_t **argvp)
> > +dt_tp_probe_info(dtrace_hdl_t *dtp, FILE *f, dt_valid_arg_f *valid_arg,
> > +		 const dt_probe_t *prp, int *argcp, dt_argdesc_t **argvp)
> >   {
> >   	tp_probe_t	*tpp = prp->prv_data;
> > -	return dt_tp_event_info(dtp, f, skip, tpp, argcp, argvp);
> > +	return dt_tp_event_info(dtp, f, valid_arg, tpp, argcp, argvp);
> >   }
> >   /*
> > diff --git a/libdtrace/dt_provider_tp.h b/libdtrace/dt_provider_tp.h
> > index 406609d1..bf73d96a 100644
> > --- a/libdtrace/dt_provider_tp.h
> > +++ b/libdtrace/dt_provider_tp.h
> > @@ -33,8 +33,12 @@ extern int dt_tp_attach(dtrace_hdl_t *dtp, tp_probe_t *tpp, int bpf_fd);
> >   extern int dt_tp_attach_raw(dtrace_hdl_t *dtp, tp_probe_t *tpp,
> >   			    const char *name, int bpf_fd);
> >   extern int dt_tp_has_info(const tp_probe_t *tpp);
> > -extern int dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip,
> > -			    tp_probe_t *tpp, int *argcp, dt_argdesc_t **argvp);
> > +
> > +typedef int dt_valid_arg_f(int fldc, const char *desc);
> > +extern int dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f,
> > +			    dt_valid_arg_f *valid_arg, tp_probe_t *tpp,
> > +			    int *argcp, dt_argdesc_t **argvp);
> > +
> >   extern void dt_tp_detach(dtrace_hdl_t *dtp, tp_probe_t *tpp);
> >   extern void dt_tp_destroy(dtrace_hdl_t *dtp, tp_probe_t *tpp);
> >   extern uint32_t dt_tp_get_id(const tp_probe_t *prp);
> > @@ -44,7 +48,8 @@ extern struct dt_probe *dt_tp_probe_insert(dtrace_hdl_t *dtp,
> >   					   dt_provider_t *prov,
> >   					   const char *prv, const char *mod,
> >   					   const char *fun, const char *prb);
> > -extern int dt_tp_probe_info(dtrace_hdl_t *dtp, FILE *f, int skip,
> > +extern int dt_tp_probe_info(dtrace_hdl_t *dtp, FILE *f,
> > +			    dt_valid_arg_f *valid_arg,
> >   			    const struct dt_probe *prp, int *argcp,
> >   			    dt_argdesc_t **argvp);
> >   extern int dt_tp_probe_has_info(const struct dt_probe *prp);
