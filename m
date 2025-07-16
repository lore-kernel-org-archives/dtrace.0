Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFAE2E36F7
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 05:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752643008; cv=fail; b=Kh2x3VAOrcp+ta60si87qxAsK6jJugOnfo9mUwjWD8J7xtZzM4auj9+agDPsrMqO5Blw2ap52R0QtHRZC+Jtz6tlkY6aLAWhmxq+FUP5q0zoKEn2vEKF1FqYX8akMyP7WvSS7nr244mqITLwK9VUCL/3y0vUfftiKGrbA+0jxe4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752643008; c=relaxed/simple;
	bh=0ely6QkHCvnj05ENdgj9hdiPEAflZQAdpszmRREX6Pk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sOPw2dO/yidIKe0hN3MBA59XcZdKHlK46eHKg7zMTMMN3a6o69lGGMEYc0y5bhvHQ8lvLgJpzn14fR8ugfi6j74vrCxHMa7IPlDfqJVBSHmr6r4dWCwADyvVUWWOdo6GsxajanclgbL+MsRSPyUW9QQM+DpouubbY9iyUmLe0L8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JCEEhKrR; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=nVfsYe0m reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JCEEhKrR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="nVfsYe0m"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G5Cc90016654
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 05:16:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=obmjWVqN4RAh/BV91LtU7hP+WWf03tHngSQtT5lcanc=; b=
	JCEEhKrR4bQUzb5lRJNJfoUzisPWi5P4LN/2AfRxMvT3sGzO/LJyu50FsrEh8Bus
	enRvDvHogMcH0ANuM7757JEI0C2Rp2g5PdvXencE7xlEkuyq9rbchLU8wkcQU2yV
	ql0fOZz0Hgf5Q+CuqOPZ7mTb8mPot+ec7xMKEp7wjbJmMphqBKQDxdLdlYzK7b/F
	Yv2sxZzWzCU0j9LVxchxBv4QSQfJ9jB/eGOkTBhkNyyDwXLgDvS4BYwYH4Svz9pZ
	/zEoJl341xGfRMSFKa0mxxv5D69K2YBLFQAoRLq72hRfngDHH/yCqcmwS4MK4TCT
	EHUJZnPEikbD+atot0GByg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47uhx80cpy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 05:16:45 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56G2HArZ029722
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 05:16:44 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2073.outbound.protection.outlook.com [40.107.220.73])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ue5amf2f-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 05:16:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r+JQY7YP5djmc2Dq5sdeVqqDvqYgnfCWUrmU3dk37Gliyt1ytWmqOtXAQ0nMsN8EQJk/eDybpSpwRIULWglC3B8ASqpPHK2PNxqDgxGvMIGEv9CsxRv5IXSPUA9mBQexvKwbYzlXKSHWrykepYfD1bg26S17WqzDuz9SKVN2B9RR4TDkcb5EwKUyTzXVa0lfvWOjnAijHGM6c4yeHOhL8mWtA8lgEw5woNGeFpgZBfVfC1j8QBVxdyLuhDRqt+2lKLdCobbtcZaCTVS/8ZzdEAg3c48CCD9+REmo4qjTjsrBTf++xaV6q5bQKpxwA+soxLZQ40e9wzncYTO8B0jaAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ej3H39vsHsAjGVA+I0/0VJSAV16Fm5voivbbQOg8LxY=;
 b=mXZE228WGL2q7Ww37bz1TzgQYGF8O/m5cLXfZSbdUlCj1VKw9lJETPW3KhXNpVffNNANoWl9R52vOh+NSAxWoU+uLopUBRhQrGTq0KoDHWygv8rgy5/fbNVyAJIavRHMIQHdSYi8o+9fz35QiCnloMr9Zed00/5p5urYUcnU6pPWQjvH72sMaZUqj7ZfwApRTUh83H//kMCFybHUxBGYpm9SdoTz4WJK9jU7G9hqfVJI99b2FzutvqZzXTO9tJeIYxZ5QUGjs+YEslOJKLeosp/f5ZTbtuA2QBlNiKpX2VgRWlm7xuuBYqvX5h9RqtRB49TaocVvSixZRtnRyzqmgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ej3H39vsHsAjGVA+I0/0VJSAV16Fm5voivbbQOg8LxY=;
 b=nVfsYe0mIHjM9sFo0CBmbG8oSDXE8MkB4eQaSDUiRdlHya+7+nPaTLoA6/Y7/4UeaAabU34TPjJYus3I0jZQ05UQ04ovBxRO0G3uS+cnqcBXYyeMOTF+2RADuiiHNhriQmLX5kubuRT81xFUypqYF2ZgQUTiUWBGGQ927UerYz4=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by IA1PR10MB7286.namprd10.prod.outlook.com (2603:10b6:208:3ff::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Wed, 16 Jul
 2025 05:16:41 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8922.028; Wed, 16 Jul 2025
 05:16:40 +0000
Date: Wed, 16 Jul 2025 01:16:37 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 1/3] parser: add dt_node_is_tstring()
Message-ID: <aHc1tajKJW6lAuhP@oracle.com>
References: <SJ0PR10MB56724E05E20180520803DE8DC257A@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <1c67ce82-fbe6-2fa1-f8dd-c92ea3eb0932@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1c67ce82-fbe6-2fa1-f8dd-c92ea3eb0932@oracle.com>
X-ClientProxiedBy: BLAPR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:208:36e::20) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|IA1PR10MB7286:EE_
X-MS-Office365-Filtering-Correlation-Id: 137cbb00-f1d9-4977-fa1e-08ddc427f21d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?Z9LYfXUAeGlY73ZmXwOVmO8iBXG907SOUvKS6zUJgW4uFQ4fm3SxzhzTys?=
 =?iso-8859-1?Q?SSS9Qyf8mvNKRuczZt3Bwzm+ygDbeac60kIv+0kXcff6hCWRFAzkhLf4q0?=
 =?iso-8859-1?Q?5mbmfxywRSZeAMoYk2DyX7muIizwjyhIZOGFk0TUcm6rk3ajnph+Llx6V0?=
 =?iso-8859-1?Q?ju0lAkXziRO9jMoMNf5P8SS+CCIRNtLfFnnWRBjQuOXHcUm4FdsSiXVeA/?=
 =?iso-8859-1?Q?TTCjyaHJwRQHlgfvrHVFN4ejmtrjeh7rRH5tvebUbjNbpM0bg+uGBrbe7M?=
 =?iso-8859-1?Q?1xvV1MV+/btHHRPdzRytIivE7q20jpedwSK/fjKlhg60GHeYdbE/9eFfz1?=
 =?iso-8859-1?Q?MCtz7OlQHDcyHAmBPuMGoBKBWtVoHrose+WOP7VP6VSKfJrZBkZu/MyrQV?=
 =?iso-8859-1?Q?6kPWgIdzHlDP9UskA3XdhGEwX0K6tAa2XYTd/v3ZO5yRCfINl6u1OuFmuF?=
 =?iso-8859-1?Q?ovTp9D8NVtXcIfTG67a7f7eZQWAzrGuIQ0hfDoOBTz/RLI+C3xoBNJ6Yi0?=
 =?iso-8859-1?Q?o79tTmp2tIhBfFV/MJZnzrxV9B4kV85ENiKG97cbSIeTA2QTCTlX3KCKPJ?=
 =?iso-8859-1?Q?LZWuMgaAjdukD6e8Csndzo4LlhpY8su45qVKO+T7zfDbozbIr6Hk+PZWLr?=
 =?iso-8859-1?Q?AyxxGmmev4zzIJZNzRhX1WB3fyVON0kAOzzRr/y3qHvX/i2ji5zih7CNIO?=
 =?iso-8859-1?Q?nBwutJvR7CdugWnhwTTPkl5auHnPcUJqNOew9emzQrQy5HHUDt7c5DkN8E?=
 =?iso-8859-1?Q?4Uw3Dd5LEPelt4BggdCdqmDbwFZ1WTTDMjYrfd+3kwlob3Hdj5cy3XgkV6?=
 =?iso-8859-1?Q?QVLSqaLsjUIa7F8BXofJwFBlp5Dw4ZJ6kzjNxEu7RvMe7J9QNJodQqe4xY?=
 =?iso-8859-1?Q?IYN7hi/EAJ0iM9BsewyALtxEtURK7guXvn3aF45n/fNR1J5yR6xBvT8ppE?=
 =?iso-8859-1?Q?4ifa3DZldcOIkQJAumAFnCMDASZ2zZYkID/0qgtzi8j3p4VX2InQVphwlC?=
 =?iso-8859-1?Q?Vc3rtqbEvEuk9Ne5o1ZCtBvxUcTGEKaBbK5aFpkbZbhB3yYh1xlojOIGhq?=
 =?iso-8859-1?Q?2ochrhHXUjVucRpNbKkVlysxt8lv8jWmjqWsn3BVc+D3mO8YrJe/HOoQnK?=
 =?iso-8859-1?Q?NSQ4mqtqolXYfAju3ISLDh9HEzIh6VcJRn3p9Wk3KmqlqwZssElvoscm5K?=
 =?iso-8859-1?Q?/ZRSd5ikYeUaqCTZR1mWE6FloJLMtQU/rvTeQlI8Qr8FinSLxO7QigOola?=
 =?iso-8859-1?Q?XsFh0uEeJfBWqYqiMpbBYRMz92iFu4QjRQWqnSIKJ5ijGfOpzqWj6vNG1l?=
 =?iso-8859-1?Q?eUAJYdRG9DYWe5ryAI2Ovr3c5JMqXk1YHW2u236IB8OZImJMqALjaE2Nis?=
 =?iso-8859-1?Q?VkR8c6cyt2JkdFHtOQeV3h/zX2U3kqMnp5fgutGj2fUUn7//q1HX2nPhEw?=
 =?iso-8859-1?Q?iweLVPPXVvgBteA7bRcx6SCVBXqCUFANLCdE4oD8KeLY2rxCLaW/7fUsv4?=
 =?iso-8859-1?Q?8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?GpXo+okHlFeN/xU/TTdnXxP3Gq3aLC5W9Pu8wsom7C6URebmPmCADEqldu?=
 =?iso-8859-1?Q?twzpBEHigUZFDwDJxq1usyJV4QK1y7dIwa3DzU9dZqPQXFMAMOgcFx0LXS?=
 =?iso-8859-1?Q?HASiNbDI/MjuPW2gPkWQLT7arNLADnhdPnqEzyXa8nuAh705M53vIJA/XV?=
 =?iso-8859-1?Q?yRsJe00xlaVEBkBE6bKlMXBcZpxYuGKc/ZRguI3bv8/kw9KjJW/nY5dUJO?=
 =?iso-8859-1?Q?JThOImcwON2IqKxFhbAv9X3qrEV8Z0zlfbeZvmqtQkytUr2HMvGp6W2Gqk?=
 =?iso-8859-1?Q?TH9y96EvdDJUPiZ+Nst0EwU+rUfSC/WNIdfuPKsP+TLGuXsJ+RCxnDsn4i?=
 =?iso-8859-1?Q?B3rs+DxBOZRakKtLOreAHucWx5zJAjPJoVTOTc5iLrLMZT9CvpdNDQT7WA?=
 =?iso-8859-1?Q?f5riUKAsh87xnlKYIWqASPacHhEDqIwgqO9ise3HLXaoTfE/UgJ1Ej0LS6?=
 =?iso-8859-1?Q?ynszDCmGnab1Mr2RRtUdSdjdfheCoKObnuS7Pc9QLXX/i8HmFNkuurClik?=
 =?iso-8859-1?Q?lUHgbRN0EE5N57RxkaD6AjLGGW4j53Ko4xxmfwhqgQVFW3Q5/mpsGtS3la?=
 =?iso-8859-1?Q?sOI0grNWrnpul78pLo0SKQBY9hiJRZwHK+Q0H4wAgqVN3R4AcUNpDAuNio?=
 =?iso-8859-1?Q?UgxMJ+gcOyImyL8JeKW/AjGudEpGTjMMicdIOSdENAQ5s/4/tucKFnTFDB?=
 =?iso-8859-1?Q?c3j6jOjo5y5c6rSdmD1t2U0CxKCRwbdtMZZx7qxIjpKaWtt+c+3svECzJZ?=
 =?iso-8859-1?Q?Pnzk+bkfoQLj91PmtFpgwhR6qxuX19eZ+TM30ySm3MzTTvdgl4RAa87Xjz?=
 =?iso-8859-1?Q?6LCGPsjUtgs2FKvEVu8oqMYQklZtqE69CCzzstqedNA2tFTHBjIK5IM9vS?=
 =?iso-8859-1?Q?/vMWV9bvrPC5EIScJLSbxc+wApsho1t5FehKCK900QgPtfdF+gJksd1VON?=
 =?iso-8859-1?Q?MqKQGEaYExF8WyjOw69PrHc2+/RIem7xaR7JVgoWVOxlaEUZf7Yjex0oSo?=
 =?iso-8859-1?Q?LgkdvbsCLwU9EyVru/SSf2DYK1zhGk03LHNKCvC26XwSYGMVDq7nqAlwI+?=
 =?iso-8859-1?Q?izjFYb1ineEqL1/kp9waiufA+bWeat+zl8uDKG74IE8iBk6pS8Hhp6EvFE?=
 =?iso-8859-1?Q?hxkyeWltZPGFFGCkB0/TrDOzg2VXNWWkew7e3qKc8hHjet2fUw0uddg7Va?=
 =?iso-8859-1?Q?3Wi/re3tqxPjd7txh59a1AnnerS2K9g1fCRTTgJPwumT+D6MuLJvRBfS6+?=
 =?iso-8859-1?Q?rTFW3z94NW/GJGEhEduVjA3EUX9pcCrG+j0eEb8w7DyLUSk/cOOCl9i+C2?=
 =?iso-8859-1?Q?KldD2jCHbPbVWc8iCQLDqao+DoMvGcTX9BDsICh098B59mTvE6LRowjzhK?=
 =?iso-8859-1?Q?AkSUFbvOCjl7OkgYo4VXQ5IpLJLOTpq2W+u9FXnYs+Ku1raRX2LNikTjkH?=
 =?iso-8859-1?Q?s3Fy4tqAox9DB/Ygcxd49/p4oxFu3i+1XTzMOAu5cu7HqpehQ65Mag2084?=
 =?iso-8859-1?Q?OuV1DNH78/1+4Ah03qBwkL0TdWfIHgl1NNVKaBHT3tpEBq5JXNhJY7+ZfD?=
 =?iso-8859-1?Q?uWy3m7or6Nvw+9jcYnPp2IOc4oporh/lU/kMW3Ra/k8JoLp7rUXOW9E/F+?=
 =?iso-8859-1?Q?p7dpCRcQ9Romk4nBEZ40pCeT1PQmRX5KFYbwyGzERudQuMhRiE97lHyA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EprOuUXbVXhL3ne1Q9yjnRSSQUB345YAjFnbRbTo0hCP1r33TXLGAbIA+UP8X4UAqnIGY6NMPITRS7/8X0Fksuzaq380JN3fTHd7hgR9zeeUsE5UPKkKSSuRKYCUXPv3HN0LP90W7B/hkapSgwrC237mBlC8BnGb7l/CZvaiP+c9frwK0TF7DT4A1P3GbWu3GH6spq4eI3pkTJjgMo/YEmRd3RIyPCJ5n5Pph3wGV1RFuDaZpkNuiRo2AGjdJviPWwMW58OvFlgijH6IDVj9MUHWMKeNg6gVQiR4mIREfb+ZyKQsy7B6qrJQiHfbygLyhZibHJ7kuCqgADDNzqEn1JzyAE2dbBSwQ4okKmlCMmOH1ufzaK/wZraJGCMbFjmxM2pAB22By/FDbaa2E61ki2gGq79QZkft8/ml5XLmNO/HS5K1qGH5It6UOO8Y8l8em6hmiy9vpDkHfESpGAO12eHZ9DeJLvbovmeKw3/9HkJ8W9EaU4JJCy6KV8FRB6FG1gicuTz59T5+QSLLw04jEBaonmhMUoeqgekNshENyeDvarvrZPBOSoeZxD4M9qdkoGY9A4D0DyrBMS/32dbZDhrbv5UZAn8fYMfeqlAqoWs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 137cbb00-f1d9-4977-fa1e-08ddc427f21d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 05:16:40.7747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lpXjO5CwHOO0GbWZAmqlkGTWP70UloBsqQbfEU0WelSRQ+A3b6fXc+8Ct/Jk+OHEl1mptp1Y9+KIU25QC9RqrzgRxJOGEID4079ss2jo9mQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7286
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 spamscore=0
 suspectscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507160044
X-Authority-Analysis: v=2.4 cv=auKyCTZV c=1 sm=1 tr=0 ts=687735bd cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=NCvHdgWKKdxfrKlzpW8A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-ORIG-GUID: sWIDY-HP_0-MKc54x1cHzY72IoZwczOg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDA0NSBTYWx0ZWRfX97HW2PcodD8Y ZGzDUgatubvGxNGGSaM/hARGDgHHYa0PBqeh40Ea0Gk5Gwd3Dsw5UQqsCkWf/EQ7JMI8NTu40kP 6KDlhp3mZyW8wSL4N9eFKlY5yI9wvMiRT1wQRuzYOaqCRxW1miZLSV0GjsB6g8tW7Iex2konwxN
 NuCdOsZG7EHMCNuDba36gnl1YEQOMOKz1qs4DStG50JvQy6TOzyrydOfMT10zuB9RC4+QQgmo9x iwLsuSWzC9jQ+d78qk6nDq/ZkD5J3DLwQ/epLzd4mXQ1t0YtITnmMPzjw0Zw+PpPI27Jfbb2PBn RAQZ7Mw7ln4ylIz51++Q5HXDidMa5faZD1usXXEVPpwwCysuylkBOT92LJdJlq9Vb5KUnPy4/wu
 iyyXrMnqw9CQeGqCYDTLijb+OQhMRFi41CsrRPGFCK1o503hcmjpmA/FhCo8XS8xFAqf/xMq
X-Proofpoint-GUID: sWIDY-HP_0-MKc54x1cHzY72IoZwczOg

On Wed, Jul 16, 2025 at 12:43:10AM -0400, Eugene Loh wrote:
> Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
> 
> Two minor comments:
> 
> 1.  It is practically unheard of in our code base to start the switch
> statement with the default case.  With maybe one exception, we put the
> default case at the end.

I know, but I wanted to really clearly communicate that the most common case
will be that the node does not have a tstring, i.e. default is the most common
case.

> 2.  How about using this function in dt_cg_tstring_free() so that it becomes
> 
>     static void
>     dt_cg_tstring_free(dt_pcb_t *pcb, dt_node_t *dnp)
>     {
>         if (dt_node_is_tstring(dnp) {
>             dt_cg_tstring_xfree(pcb, dnp->dn_tstring->dn_value);
>             dnp->dn_tstring = NULL;
>         }
>     }

Good idea.

> On 7/15/25 15:50, Kris Van Hees wrote:
> 
> > Returns 1 if the given node has a tstring associated with it.  Internal
> > change to make implementing optimized tstring-handling easier.
> > 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   libdtrace/dt_parser.c | 15 +++++++++++++++
> >   libdtrace/dt_parser.h |  1 +
> >   2 files changed, 16 insertions(+)
> > 
> > diff --git a/libdtrace/dt_parser.c b/libdtrace/dt_parser.c
> > index eefe8341..f777a910 100644
> > --- a/libdtrace/dt_parser.c
> > +++ b/libdtrace/dt_parser.c
> > @@ -1227,6 +1227,21 @@ dt_node_is_actfunc(const dt_node_t *dnp)
> >   	    dnp->dn_ident->di_kind == DT_IDENT_ACTFUNC;
> >   }
> > +int
> > +dt_node_is_tstring(const dt_node_t *dnp)
> > +{
> > +	switch (dnp->dn_kind) {
> > +	default:
> > +		return 0;
> > +	case DT_NODE_FUNC:
> > +	case DT_NODE_OP1:
> > +	case DT_NODE_OP2:
> > +	case DT_NODE_OP3:
> > +	case DT_NODE_DEXPR:
> > +		return dnp->dn_tstring != NULL;
> > +	}
> > +}
> > +
> >   /*
> >    * The original rules for integer constant typing are described in K&R[A2.5.1].
> >    * However, since we support long long, we instead use the rules from ISO C99
> > diff --git a/libdtrace/dt_parser.h b/libdtrace/dt_parser.h
> > index 13f3cc99..ff32a84a 100644
> > --- a/libdtrace/dt_parser.h
> > +++ b/libdtrace/dt_parser.h
> > @@ -182,6 +182,7 @@ extern int dt_node_is_ptrcompat(const dt_node_t *, const dt_node_t *,
> >   extern int dt_node_is_argcompat(const dt_node_t *, const dt_node_t *);
> >   extern int dt_node_is_posconst(const dt_node_t *);
> >   extern int dt_node_is_actfunc(const dt_node_t *);
> > +extern int dt_node_is_tstring(const dt_node_t *);
> >   extern dt_node_t *dt_node_int(uintmax_t);
> >   extern dt_node_t *dt_node_string(char *);
