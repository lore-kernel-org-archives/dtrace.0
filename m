Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FCC192B90
	for <dtrace@lists.linux.dev>; Tue, 21 Oct 2025 03:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761017223; cv=fail; b=sRa4JFRUK1vXssJMM2cBVlxNDynvZ03ID84QzM0NRDQTVu5JE4hp0YwVnwX7ncHC3I0sL2cKPjRmjhlusKe7kvAS9MSoBfhLwPWpFrIXG6bgIJvJ9zg6kA3weqHuEwonc3AXBVa1sYmv1JwZnKbZv101cvBPIm2Jf5/xz4K7GEY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761017223; c=relaxed/simple;
	bh=aJIoprk7kfumLxuscDanTS4hNJl599nF4+mzFluP8Hg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=m9Jk1yAWqotKulju0Vq2cijRlaz083svPUobvFwcEiJFdUhbLm/AUv+xgm4OwpUOoOB1iskDxFNXmSVGxfQ2ZxsU6CZQH/HpV4v6c2YwzEcnxJCHEBzEDY/mP9462potLC5fUmQaEOUE7+k5CwuC+OKXPjypSjj7Bs3Bh+CQJ/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=K1GG6e4R; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=O38edtEY; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="K1GG6e4R";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="O38edtEY"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KJuwW9029880
	for <dtrace@lists.linux.dev>; Tue, 21 Oct 2025 03:27:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=b6WdtPW93xL1WcKRjp
	NRjYbstHYUZuoCZNv/2oq44Hw=; b=K1GG6e4RIpUifVzJ7IF/kxmjijYQoGP6Sl
	+4JqTVUGavWuVBmMpZFSofn2/GEP+xmyCUSVP8+L3aMsyp8/M1FN91pA8XBJm1dq
	pq37xvYO5Mc9H5362yqnzU5//lE6dO2PqPew2FBEBKnDm5jonxegdyftQ+ESpd8l
	gYuH/Bqh9QryfghwGFXAiL/fYHZY/rgOYbjzITJALwABE48JoomJ0JuR1/ZCi1oX
	4T3aYcH4zR6kYx+nt4JnrQdhm4SCnXXkhcZ0v1L6Ul0Z9xEM8DGqZaeUbRDbAZVY
	KftqQVRKMYj1U6t2OacnoTO862wraKb7tG4AgMgR15pnWF0RKBeQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49v31d3q2r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 21 Oct 2025 03:27:00 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59L0FkWj025454
	for <dtrace@lists.linux.dev>; Tue, 21 Oct 2025 03:26:59 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010036.outbound.protection.outlook.com [52.101.61.36])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49v1bbdkpa-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 21 Oct 2025 03:26:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kvo4mp9kFF4SvlwNCQSK1AKHeOdky6SAD+FqnvJhWavFRymP8JVdzWCai5/VjdGUp5IsbdrQu+CDL54NuIm12YihnqQHLYjgtH4zX4OCYf8/TdqR9qi3hrNxJyEijGa3C19CT9Xbmj+bNzWIkLkEW5YdtUGoo+X1+h3LDCqIbl9foT+tkajhCHFgoEb8oWZRPoTJZkux7seUo3LOhH3/8AaMLAZ+5EPVLU2WQfTE6dOsi4Oq96yu7W73/Sh0634m1QDF1lZzOb0eXkPh0n0s2Hulth5z66U7YxQVWNFROnw5Xj0N7bthq2qhWUSNZeBmAq9mc3N4JRTrwVANEExuVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b6WdtPW93xL1WcKRjpNRjYbstHYUZuoCZNv/2oq44Hw=;
 b=JDkKFkF9CBoSeBaqLL5WAJt3vOVR82ByFI1lWp36c4nr0moAJ7+dVcSoP4Hjs7GzRxoGB/zK8dwtDR6OCG1W5M1gNbiUhfoOQfiP0TFQ99S6t9tzGH3JDAvi8l6Ob7EQZTAiHG1cykKXo5GETL+IJnqKe5arTfbK2OQsJJGsPBhmhVpdMnT9KyJC+xzSWpQouJc7BaE4lVkq/SInmTixB9QboXK/uEocCN80hZYYK0Inj6Fk6mX3QWJoJBsLGV1PWikEdutf2Ezy6Oe1SfSxvVssWzpdipa9fAonuby1ZAcphtMefEHv9mpH41gkQpqcXfqmIhTKjXGd66R7dxO98Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b6WdtPW93xL1WcKRjpNRjYbstHYUZuoCZNv/2oq44Hw=;
 b=O38edtEYFmvjzSLYTsP4K9NCdmLFadN7IQIUbCHn4wme55arkz5fT7XyI/mrYN/bwtYu6Y0PthwVNTg1piQ4lNfeBULyh/P2Z9JnOZCl44wJATGcPEahxEDuaqxS7HOrtAJZK8Bm8d1MLqu0lN8z4mPeSyxLnDx+L+CKw4ZdivU=
Received: from BY5PR10MB3987.namprd10.prod.outlook.com (2603:10b6:a03:1b0::20)
 by PH7PR10MB6336.namprd10.prod.outlook.com (2603:10b6:510:1b3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Tue, 21 Oct
 2025 03:26:56 +0000
Received: from BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf]) by BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf%5]) with mapi id 15.20.9228.015; Tue, 21 Oct 2025
 03:26:56 +0000
Date: Mon, 20 Oct 2025 23:26:53 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] test: Use /usr/bin/perf for perf
Message-ID: <aPb9fRnkdLZe0mT8@oracle.com>
References: <20251021031907.30226-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021031907.30226-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:208:36e::21) To BY5PR10MB3987.namprd10.prod.outlook.com
 (2603:10b6:a03:1b0::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3987:EE_|PH7PR10MB6336:EE_
X-MS-Office365-Filtering-Correlation-Id: 77112bfb-cc36-4dd5-9901-08de1051afef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WAOIXUveFbuW2bOQR85HrYVj1rDhuYhYYsvOgjnphP6iz3UUF+FPfCt9JG3L?=
 =?us-ascii?Q?ZYJJZYu1+Ap395HDiWyd0X8asN7x6VeQCVdjzXpW3Qa71cUamxdbTqnsSlNz?=
 =?us-ascii?Q?DIpxXaWeLrM669xNswPCjZiMmOWoKxWea8Hndv5jHKpQn4OD+j2rrz7CVDfq?=
 =?us-ascii?Q?S2/cxPo6xZqPJCDyVqLdrOdJvwEtunQrIWhZe/XFXw/sOJeVddj+Ia4WtTHO?=
 =?us-ascii?Q?szQ1jep6t59Yw6yfj83QSQm2B2oxmMhQCnuST0Ip+MmZ16xNJQ43fmDabtfr?=
 =?us-ascii?Q?eoik71eMPi+sp6m4p5NgDOTpdz5Rm0vP+xAJTgYapBuVVWLsZiKXScEwK0Wo?=
 =?us-ascii?Q?/32ukDf2NodHI/mw7RIOoF2jk9UCpE3T//ypJjwA3JfezqgA5GWEBxtNUaFA?=
 =?us-ascii?Q?BZc0eAb+L1EgDh28wVzhZQUL1Mms6e5Y8hqNfkqjhYQsqO11gHhfPpqbz9DQ?=
 =?us-ascii?Q?jeXsquDvth6I9GDFRdtfiG6+NfMVgRJ6/sw2W7lEl+jorZdkx6tQhbwrGFa3?=
 =?us-ascii?Q?93y0M5mILVoqUUGZc3tcIAAPbS81WGXgGMdPkRfkS59MupYmmS4kMiPgjxTK?=
 =?us-ascii?Q?68/VFXHFOj1L7qHG92aZc8w9xCxeYJ1uNP9ezFo9qKTugzYoFEBXAtsdetjk?=
 =?us-ascii?Q?TrR6FW6zlX7Wbpiw9ONH7Z9RWoJa0eBasZbYlTbHTxU0Ga5ZTFF+HaecoF/Y?=
 =?us-ascii?Q?rW3+5c7hb9prYii2WvYzWLiAKtWTocoebF8O/2+I/wO/ECc8xsgr6LJY7znE?=
 =?us-ascii?Q?WHYNafc2XC/kkiDcYflzTJOQ9vQwsc5ZoRU0Hlv6HKmhzzMTWqpTbtQaW+XC?=
 =?us-ascii?Q?QT1bj6p47kBKTj6KKJAeVk7xlv2yi2RYnhF3C6EEM/MKgI0Rx2PYVFqevNNE?=
 =?us-ascii?Q?7/GALAeflpTHWDZpPe/Y23BHTY803M+IjRp6UUA2kuJFNRb2U+pKXU2VWCRE?=
 =?us-ascii?Q?yfUYLfS6B42sYueq8PoKZzNUPld5DdBtK2du2B86zHfs8FFDl1rZRJF9sZE8?=
 =?us-ascii?Q?Dum6d6KE8axXf+MXxU7bY42Mqywnd9I2D/cTJr/1XkC48j69JpWJnrGi67SR?=
 =?us-ascii?Q?sLt5uwTYyXFVsojn0f/O8vdSxdiumkXHRV1JsZUy9OFoSh0v1FbbNf82SHRw?=
 =?us-ascii?Q?/iwoAA9XvrRcnEcAPueSVxv202sQD0FLGaNn66T/gj1bGklTnsmLi4LEIaiL?=
 =?us-ascii?Q?m6efLzCxtCOJ3YhxuYX8eyrSm3MbGfGicYxJiE1niuUjssUM5C9SaZBnIntc?=
 =?us-ascii?Q?ixMAFcIRs+Qmbq2Ko2NI2P8NVtN2dvjqRb7si7hHIVETNJvmzQFlFV4QgxjF?=
 =?us-ascii?Q?KYYFOWIK1wWyxvX5Y90aFH2xQJv1t92hw1mywzUM3ws1ngjvzcuziQL4vQpt?=
 =?us-ascii?Q?7AVBdR2KtNx7Ir66HvbIMxnEUn8ScN/VEhFYfHCjV0agYvAJagrHIAAanXKd?=
 =?us-ascii?Q?PbcoTQHtAw7jnf/jjJz41Jfi2mk4qwVmBo41wcmAfHE2tEiqDA1T4g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3987.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UeTxEVBF8QSYWFP3DomWHHJQQdR9fNzv8gfxuvNq1C+C6gLwLaddarWkkEp4?=
 =?us-ascii?Q?SkwOOKvOhgDohrXZpUxXQIdsoaiRaXguPxRHczzEjpDikQEKgxORTGXr7CQp?=
 =?us-ascii?Q?AeNdcnYyID9/U8Jtz2EURjRCke3RpAM84lxr51rXtUlTlB6+S0oAm02PMMxN?=
 =?us-ascii?Q?eFav0J2/eJd0uKuGZ7T4pCsT3YQshHX6bnSkrmd/kJItIO2oovrLspK+zZt6?=
 =?us-ascii?Q?mzNmkyw9zt0+BB5chDKv2N/i9bjyZjue1nPEc/lKSIdlZSmoJr4ImKS3YTdl?=
 =?us-ascii?Q?aHx43X9LVmHrLyazohUDafH2cbJnTExphFiyLlRN4V1Bu5UJ+T4Qp0QEr1no?=
 =?us-ascii?Q?+weXU/DoPv8W7dqtab1/+/4a5fBSNLaFWczOEJFsuzc15n2hUqJMlWDFTYED?=
 =?us-ascii?Q?RjDzsJhNkfER1MJoEkKzBRGxDtaHAO4MSFgLqUNofSmsNf0q5ML4+TgZnFRe?=
 =?us-ascii?Q?GGKTdq1y+hUWTu6tsI7jlRxxLK5ydsGTiUko1GLNUmgJMjbj0huvPjbgJQqb?=
 =?us-ascii?Q?wRBAKYCUoN09uIYVH3/x4VdeD6cfk4Vkh2/c7hw+IcYhsHgG5DG3D28lWFS0?=
 =?us-ascii?Q?FwYzaU5cAgt2duUm0WxoBUX0edSKSa42t6gY8P9cHHX1KNyPlTabbeiQY5R6?=
 =?us-ascii?Q?qYc9laXAXt5woRcqX7pfXB43jtVi8hGr0SS2ZDxPMBBmX+PCvkvdeeLmwwKB?=
 =?us-ascii?Q?AHBKRbsYSTc9PEazF4VvlXXNSI8hILyPy4Z2pzvPRXlBnd6ofZLD88IqADD+?=
 =?us-ascii?Q?AZhhZb8EhCkfTP+9ANQN5vUp//PxlGvwsCUqB89MfZn3tryG7gZDCD3gd7rx?=
 =?us-ascii?Q?a7GneNlsNktKKt8tA4vLSm9eVw8BydIvZoOp8QSABXsEVgtn+gSxkB3rpRww?=
 =?us-ascii?Q?lNPx/Kn5zQFS6cW07wVR0DVmm2VKaDq6mXCvMBDu2EAx6hX55bKCHia4BSis?=
 =?us-ascii?Q?dRw+Va6cvaPInSWEJ1KdQid4ZXIdx7bttPyBIyghZY3oaiCMJcArYhfJ1kdS?=
 =?us-ascii?Q?E8fN+BtdZ1YK8Gz2RnyUhzQZRxcuDaeYIapNjI2u2vyo6l8QregbbEJcFhQp?=
 =?us-ascii?Q?h8FBLoPmiEwUwO1nzjJfk3SkxE85HA2kkXW0PNcYYTn2zR25oXEbHIBV+AmH?=
 =?us-ascii?Q?pKIMGRLdgAs7naAnCD81uJN3jJNBz/W8RbfCYXHkTKKS6ey/xfEImjvXE9L6?=
 =?us-ascii?Q?M1NIE+U95Wf4+IiK+TGB+EvpEbq9gLemqT0H6vCJShiT8MJ4qwUvwdjdpxZ9?=
 =?us-ascii?Q?aVE1rKts1e2yU5t7Ld0uYgN9P3uB/NfTBxYhrBUriU8g32NYYzn1tTTOGLFZ?=
 =?us-ascii?Q?W/+N+KUH1bxYz3Mnh7sj+8pNqSDLSQy3ri0OZed/INAhEK4nG8ppTwbABgWU?=
 =?us-ascii?Q?Dt/w7zJ8hFJv38LLyefxeRE8iB9IOBJX7Rst1hwFXxhU+MgO4E0EKJM/jI0f?=
 =?us-ascii?Q?0e6wIvnGaOA9jiGmYH+cY/FqhBJ47got2FgW/vQf6Avd74RNV1Rn4fHcB5oh?=
 =?us-ascii?Q?Vb2YpxkWWWUFaOSgn074njTpFkABdW+nAMgpwkt7K9Hmox4kuP68leVmQRd7?=
 =?us-ascii?Q?Gpag7GuEzgBUD0lo/gF7Hg92QwJmFNOd4vTjWCA2qZ5mTaJjqv0Bu5bJz4Jn?=
 =?us-ascii?Q?9Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rhvShmWWWhAu4s/Akg38vczkR0Cs64AKay3LUffYDLGb59fKcU8iq5VHQoXPpPs3qTzvcLyz3O2aJWc8AdmJ2fhm80GdKxLRAaQBL1padxTjIRtot3v9QDnOKYKck366T61AR3StVqVv+wMbzu6MErtPoqA9QkTl7CcYcEkiTtuszpqO5/M0fReuJ7QCxwj2d9E7er5IL+z6kkxbOWDbzYs5x9DDkcmJjIzk/NpXVNzKstJ352L2UCwik7w89lq0uxvr2T15wPZttMA6DQuU/GMSJxfDQcEWAw/uX4wUE8UtTxWSUn6BpAHonR25OZOjq1m2lD6vR4PdPLECbpMZPVgksY3ZsvAqsjYLLSYDAvze1pPeca/lsUngizGUjsLWht/PMS2kgiPk34D7z/bRq9ofUKWw+ueBcufLEk0P7UhsX0GjksZ+T/s1CbLmjO7Ry4mkYq/ZADc9ge2SohQPlsoms+71vfwQ5ox8ZCiUc+sSgo13dt7qbfThb+4S3hFfajQeB25BiOhcorIM4X7plTI1vShBgAhauRjnjo2fYMhIoFgj1wUP8JIOqpSJJt3PTza8X65MZ0QHyr7ml0sbnTTEEDJ2lcWsBizbhoVoW4k=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77112bfb-cc36-4dd5-9901-08de1051afef
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3987.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 03:26:56.4172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xKKVWO9xiPD//+f69KAukI0Vb3meWXEY8RjdbsxweznCoVXdBqi1xTiIwCal/0mvp08uPwEhIGl9+B5MWrq1IR2isweS/YFqijNNf0APfRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6336
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510210025
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfXzQpJSDkhgL+1
 cczPNXiNSrfkLJ7zx4udzN3dozyYzqmCaru4GLkK1i8IU6Vpe1yOu7GkTmSBoOm/PwjXJbkp85i
 AtT+GDXoquoFW5WkqV6jdNdB3w4o6OFd/BT2RUu7BH4ei8yM6QgOwVMACc6GyfBqtbPeoVIVZ3y
 fCR3Dh7ud/SuIljp0L9PaVXwJgWCLXXVHsYyrl3oIkAv++itZTbedBXZkunoP7tw/+skFrUc6aS
 veEEPgQd8xT5vq8ooO2ovB8zfcH9cu68tdW9uTkNoJ37HEjQHB6agTVXBlCITuRSc7x1qx44iI7
 Mj99/b2b71D7IfwBkCD4qKnDQNUH2sQkyF2XZXB7dIBFdjkOL97JSBy4bjnY1c35hFcDwNkuJGK
 lsr0mUQISs5gi0f/Cdjt4fPZBAEPDQ==
X-Proofpoint-GUID: _B8CRnSimw3JqDk_10E4fbDcS8HQE0tV
X-Authority-Analysis: v=2.4 cv=KoZAGGWN c=1 sm=1 tr=0 ts=68f6fd84 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=bUCl0xy3oVL7ZsJqV5wA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: _B8CRnSimw3JqDk_10E4fbDcS8HQE0tV

On Mon, Oct 20, 2025 at 11:19:07PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> The testsuite package has a dependency on the perf package.  But that
> package installs perf in /usr/bin.  Meanwhile, there is a /sbin/perf,
> which is likely to appear earlier in the search path for dtrace users.
> That perf is a wrapper for an executable that might not exist, causing
> some silent, unexpected behaviors with the test suite.
> 
> Change references to "perf" to be explicitly "/usr/bin/perf".
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/unittest/cpc/tst.branches.x     | 4 ++--
>  test/unittest/cpc/tst.instructions.x | 4 ++--
>  test/utils/cpc_get_events.sh         | 4 ++--
>  test/utils/perf_count_event.sh       | 4 ++--
>  4 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/test/unittest/cpc/tst.branches.x b/test/unittest/cpc/tst.branches.x
> index 4b235055d..a19d1bc6d 100755
> --- a/test/unittest/cpc/tst.branches.x
> +++ b/test/unittest/cpc/tst.branches.x
> @@ -1,11 +1,11 @@
>  #!/bin/bash
>  #
>  # Oracle Linux DTrace.
> -# Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
> +# Copyright (c) 2023, 2025, Oracle and/or its affiliates. All rights reserved.
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  
> -if ! perf list hw | grep -qw branches; then
> +if ! /usr/bin/perf list hw | grep -qw branches; then
>  	echo 'no "branches" event on this system'
>  	exit 2
>  fi
> diff --git a/test/unittest/cpc/tst.instructions.x b/test/unittest/cpc/tst.instructions.x
> index c3a2ede34..3c1e47b75 100755
> --- a/test/unittest/cpc/tst.instructions.x
> +++ b/test/unittest/cpc/tst.instructions.x
> @@ -1,11 +1,11 @@
>  #!/bin/bash
>  #
>  # Oracle Linux DTrace.
> -# Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
> +# Copyright (c) 2023, 2025, Oracle and/or its affiliates. All rights reserved.
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  
> -if ! perf list hw | grep -qw instructions; then
> +if ! /usr/bin/perf list hw | grep -qw instructions; then
>  	echo 'no "instructions" event on this system'
>  	exit 2
>  fi
> diff --git a/test/utils/cpc_get_events.sh b/test/utils/cpc_get_events.sh
> index 80d3584b2..cc833fbb9 100755
> --- a/test/utils/cpc_get_events.sh
> +++ b/test/utils/cpc_get_events.sh
> @@ -1,7 +1,7 @@
>  #!/bin/bash
>  #
>  # Oracle Linux DTrace.
> -# Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
> +# Copyright (c) 2023, 2025, Oracle and/or its affiliates. All rights reserved.
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  
> @@ -13,7 +13,7 @@ eventnamelist="cpu-clock"
>  $(dirname $0)/cpc_temp_skip_bug.sh > /dev/null
>  if [ $? -eq 0 ]; then
>  	for eventname in branches instructions; do
> -		if perf list hw | grep -qw $eventname; then
> +		if /usr/bin/perf list hw | grep -qw $eventname; then
>  			eventnamelist="$eventnamelist $eventname"
>  		fi
>  	done
> diff --git a/test/utils/perf_count_event.sh b/test/utils/perf_count_event.sh
> index 957363e55..bc1441f32 100755
> --- a/test/utils/perf_count_event.sh
> +++ b/test/utils/perf_count_event.sh
> @@ -1,7 +1,7 @@
>  #!/bin/bash
>  #
>  # Oracle Linux DTrace.
> -# Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
> +# Copyright (c) 2023, 2025, Oracle and/or its affiliates. All rights reserved.
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  
> @@ -20,7 +20,7 @@ shift
>  #   If the output is no good, report -1.
>  #   If the output is time in msec, convert to nsec.
>  #   Otherwise, just report the count.
> -perf stat -e $event --no-big-num -x\  $utils/$* |& gawk '
> +/usr/bin/perf stat -e $event --no-big-num -x\  $utils/$* |& gawk '
>  /^[^0-9]/ { print -1; exit 1 }
>  / msec / { print int(1000000. * $1); exit 0 }
>  { print $1; exit 0 }'
> -- 
> 2.47.3
> 
