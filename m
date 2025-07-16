Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFB81ADC97
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 13:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752672210; cv=fail; b=Y+FOqV72lzCThLGd3L4ZmlT8PQvmfxKjIygSCbWaY/6r3pYbqEUgTWZzkwYsc6XQ4KdXcnRapkEx9HAflb6+tw2xte//D+FgmVbySf4LfkdU1rtgcd1veGvKOR85qHx4+HeGhzETYDK/3HXaSbuYmZhRKeHErXrjNreUgF8f/V8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752672210; c=relaxed/simple;
	bh=9eEPKzX6FIT9XnL2GkMVzjqacxmRJ4dt4CIy5mz7oPk=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=nI28Md/8W5sE10DhIAv8V/f714Vn16q1QDUGhGrB0TsVtGgrhhjZUSF2Fa+6MZIXNRrS3U/iqqsQGrzdS9peR+cRD3LoA/5TXZ71n+aioUHHKMwB6lG80Jf69ze+QDZoM7nZB/ESeza9Eh+P2AKJXF2ljxJGko6W40DKlDQuXo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=APWNLxBy; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ncx3U5vi; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="APWNLxBy";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ncx3U5vi"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G7fmHi018571
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 13:23:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Ie4/qtrjHRWDFTEqy4
	cdfDXvNLuENrDmkNE6hnp1sS0=; b=APWNLxByM+mWu1cGxnnzoey5UzfQCnvNvb
	wpexx3Po3RHx3eOXokSM1Re6OceI1P6h5/wMZNEC3TQkNKaYwbAnqDfQlHZMKNSF
	Vrvmf9pfpNtQ//nTwPUddw8za3x3yAOLnSRSDkqkqKM5pJk+mQEUpdd8f9PfGR87
	OBfLrmE4OGdJBVRfC0vW6OwFAW/a04ZaYCxdMwaQsJ0qpSQDZUnZLBdtdlIAb1So
	zI+prGN2bgzeo11o3ybbjVmJW4/Oj3156yPPw8VZ81R8TzWf3DjvWmDqjp+Fn8uy
	TqA7SGaK3wvvDMT7zUl+sTV1TWP/EjnQ7NxfxYw+HVQ3PehCNfTA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ufnqsp12-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 13:23:28 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56GBPXQ5011745
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 13:23:26 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2056.outbound.protection.outlook.com [40.107.237.56])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ue5bbm2k-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 13:23:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sdr4D8SI3a1/KIGi7sX+SDrp/nBzAchdDp3F8JYxbkNTt3T0yjJk1pv25tFl5Rn204uJyrEZuKRwkjgNlBf9hOd2qeTxVdIUikJASBnehXwiPcFv4NXWIdePScqCK2JWPh5YIB1jHgAXLW7gbmTSpNImhx2dg8izOZ11bmcbqvmF1BHWUULJxeYspY9nOqtZ4TlGq0+N5xOKT4IU8S7oLE1OvyU+kcNYVmCxK55pmkJsodnKegUmqQBnSr2BRIxKClHwlIrbv8pKUJ5/Q2ekbn8QfqkVksJ5yPASXYwAMHSke6Itsm4XaL7h3C1BGK+vxGUe4baIFLBoxgW+t4iyog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ie4/qtrjHRWDFTEqy4cdfDXvNLuENrDmkNE6hnp1sS0=;
 b=FzZTvGJIMBJJ3Be+BAPMWI5L2E4zUeY+cCKomNlcD6w/B8QanuSyIxuXHPahgvbCrx4PcsqR+pfCBxIKjfpH4f+NL38gOnoMzfwbgtHqgEW0pOgVPxJG2s6SCr4i/lHrAHXAgQdW8h7vZkW0RKI4SpZXGofaFgPIsfXbMTl7HJpglO4EtOMTZeNt6MbuJW0Glc/usu5c2hd2tPif5jdnS4PTZ2JRwiPPJitziSWQlsaAspw7pQgRDyzr8bwuAMxYc6me5YRVpeE4NqNmdFqL6Rg8t/XbwZBbExw9wEqQ8YoZ7a+wt+Gj7E0GCGvmI+0D/FkxR9Q72H+X7VEvG1gVdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ie4/qtrjHRWDFTEqy4cdfDXvNLuENrDmkNE6hnp1sS0=;
 b=ncx3U5vijkyDo5Sqyb6hS6WoH4bl2y1DUs0Pu1gt7VdX8OE/g1svouPJ0cxJa4LQVOHaXenbLj9WUi375E/zSd6l1scyhkTbMqz9UV0GggTxhbYgAIsoiiQVQAa8HA2VYhs4UJw7+oQtHaP8IvtOsG6raqJufoN7vWDfdQu1gFE=
Received: from BN0PR10MB5029.namprd10.prod.outlook.com (2603:10b6:408:115::16)
 by LV3PR10MB8180.namprd10.prod.outlook.com (2603:10b6:408:286::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.33; Wed, 16 Jul
 2025 13:22:56 +0000
Received: from BN0PR10MB5029.namprd10.prod.outlook.com
 ([fe80::b85a:c2fa:6a79:393f]) by BN0PR10MB5029.namprd10.prod.outlook.com
 ([fe80::b85a:c2fa:6a79:393f%6]) with mapi id 15.20.8922.035; Wed, 16 Jul 2025
 13:22:56 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: "eugene.loh--- via DTrace-devel" <dtrace-devel@oss.oracle.com>
Cc: dtrace@lists.linux.dev, eugene.loh@oracle.com
Subject: Re: [DTrace-devel] [PATCH 3/3] test: Mimic dtrace arithmetic more
 closely for avg/stddev
References: <20250501182252.27772-1-eugene.loh@oracle.com>
	<20250501182252.27772-3-eugene.loh@oracle.com>
Emacs: you'll understand when you're older, dear.
Date: Wed, 16 Jul 2025 14:22:53 +0100
In-Reply-To: <20250501182252.27772-3-eugene.loh@oracle.com> (eugene loh's
	message of "Thu, 1 May 2025 14:22:52 -0400")
Message-ID: <87ms94mfrm.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0477.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::14) To BN0PR10MB5029.namprd10.prod.outlook.com
 (2603:10b6:408:115::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5029:EE_|LV3PR10MB8180:EE_
X-MS-Office365-Filtering-Correlation-Id: d4d20b84-ec9d-4eac-8c90-08ddc46be063
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uwaf58sbsDwDPMY5WFOXxI/eocpOCY/4WA9WfxyjNpMTiVFRwUkjBSN3DnzC?=
 =?us-ascii?Q?KrVSounHYTxedaLMl+836epVZGZ4u8DcZJvTC2DdG64NzO+yHF3KKvRS3xTT?=
 =?us-ascii?Q?WDc2IowSXAEPEQRd6PHEIzvMljg4ArqUFo5qkq+OOBFS632jA/X9c+l05Kvi?=
 =?us-ascii?Q?w8AyYYQO8YAoskFmYL2pWkLsCEYw13OCZ6lnWE/c7sBgN7cekD4kjptucY2+?=
 =?us-ascii?Q?mKcDwY58GGxB8yGP2/qlYRR99vWPwluPWbRTDXJMEjt/YxsX8XQ2bBnpfu+4?=
 =?us-ascii?Q?8oCAlxFvexb2xTrVoLg/8uvrAEqMStajsi9IyOHLEqSyzynbup6k5EM0U7vr?=
 =?us-ascii?Q?0oMUCWRHHTcZDHZF2YRn/xBwkx2Sft2KwlUnDDSYVyybhkqOA4YwQTVm0oTZ?=
 =?us-ascii?Q?pfy4Eo9jPEegxg/E9zG2p6uacMmgAc1gMqHn9sIS9cvfnTOegPNBQVXsV9qO?=
 =?us-ascii?Q?c3DcAYldmkn6ihweORhZ2CZNVdPP6zq2hbozvtHsPhK3QEyzl4RgjW1h5Ocw?=
 =?us-ascii?Q?BwL9WDK52zTUheSbbzA0IoY73dH1rRdNasrDozPAS90vQYjUD6KdbQjXS74D?=
 =?us-ascii?Q?4j+O98JX0l3p5b4sEUuPWL5YYRwO8rL+cORd4e5+YlIDD1YhWEqxmARgmp4d?=
 =?us-ascii?Q?aFHX9wWVM1P4Meg+4H6bu9EMzGH9xf5pSpcxERDpQFLPvQoiIykdHhj8Tw+R?=
 =?us-ascii?Q?ohrxTuZLFQVQcDvPx+D+1fQTX41neL1IsOL0jHQ3az3trsPdqa34yLxuFNDP?=
 =?us-ascii?Q?aX/auo1oPCwKa9lmf03cONueO7Ll+JhxZQtVcSTo53AeRZ1b5iZGr4VRqUz3?=
 =?us-ascii?Q?5QxSOYezDfzMkAYhQRJYW/WeSA4sIXPatFlKjl9wdd+E0YjUbx8C/NU4m7fo?=
 =?us-ascii?Q?VmPN01LkV5Qo1pEI9aybA5Cuf3/RN84yqffPMwWtWU/XTIXQ8MhN6x43kA1M?=
 =?us-ascii?Q?kTHgUslLtZUrzVyf5LMMbpYVWbo85ayMjrEY0oHOoDc6nVjh3vtfwgSCjt8O?=
 =?us-ascii?Q?yYXsheikeR+khJQZv3zlq4pXG97Mf49raFZ8JqYXFmO8v18hmEMkgkBtanoK?=
 =?us-ascii?Q?HpE3aWhChgKDHn07zvxnsD7b8oS/RopjIg+uwBb6ORdNDRaeOYPLP5V4eCR0?=
 =?us-ascii?Q?5w59x6QyUgjHk/avrOX6/A5PgwjWel3UuzfW2PcuIUAwQO3wz/51pPBIu6Ul?=
 =?us-ascii?Q?/b9rpor2HXFXjaR7ZhS6zcgjdKxRpFpFED29dVe3fdkbMXHckWb3Db9Lbgeg?=
 =?us-ascii?Q?Op7ZNZDtDf3UaM198gLaHZpQvbRYFD8hzGl/KUTXuP8Q/GF76g8v16tAEUxR?=
 =?us-ascii?Q?42L9Qn3GryYLFXPkC/xJBIIghhugM5hzEEIN2Gnch2cF3TLH+xLqt/kq4CWz?=
 =?us-ascii?Q?Aivv2Cm+BpyvVyqerltOL0dUHnUxhY9U1DltAp2+rH8CLVMDl2k5nVGQsmnf?=
 =?us-ascii?Q?kt70A07dIaA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5029.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?04knc1zIjyL3gSi8XISvFNEoXXbcVP0jsLaK4mYLgZTdeiv1DxZV7NK2gneF?=
 =?us-ascii?Q?cZ+Wf5SMbeH7M7sNvCAQV0ZZylU946B1MQRbo9IboEX+r9O9ejsK62hlMk8i?=
 =?us-ascii?Q?Uc7hmJajNiNiUIxy3W8zMy+7kzifJaxr2p7oJ3sx3YzlbPUaKkh+DjUi/J9l?=
 =?us-ascii?Q?YW9+esxwEONog2sRpk8ovUgnotS/+/SYHc+CyPj6q8TQddeuhhbbNgMY84uy?=
 =?us-ascii?Q?BKRjVw9IMI49CWV8cIZwSoqv9UOokc2/R4t7+DvKFoZ6pgvC+RZpNYS/MXyJ?=
 =?us-ascii?Q?8XOEURiU5yQhyPm2enX5eY3c/1hqlWdQxO+vLcIDAd2QKL4OzXEqkmOmh3Ch?=
 =?us-ascii?Q?mKWY9nynfYlaVxtobaRo6B60boUg/qdhA8oGJPBwGXvp05ukA84EE7VI3vt5?=
 =?us-ascii?Q?ic6tsoKZ9kbD+mnNQzF9uYZPOeQ73+cFbbC1+B9ARWZCJiw/5LIXTwqa4d2h?=
 =?us-ascii?Q?5hzh/3M4XXlF5rStOYI1lVS8uRPl8FPf8r04rMmJjH9Rcb+yXo0yzXWGHrOE?=
 =?us-ascii?Q?6yJ4YWgeh5R+y5KROMoRkgkwRsfmBUT3pJhrRwfQ7MKM0+/4HnN/l50nU6/Z?=
 =?us-ascii?Q?kW95vr5Xl0ICiNqVNZCjG+mhqXr/7CoOgG9gyFpMOeAT6jBga5LRmCiBE9Wx?=
 =?us-ascii?Q?hhOwzoDtJWZMB+ySC3X9sf8uEmy5Xx6HqT3TfS3ijTUDt69V67aXQSk4JgWn?=
 =?us-ascii?Q?5onMoCrOxhjiXRSNOhhe3whYt10wCM3+SLpgaBgJKcr/l0ZDKHHFGBfyNfiE?=
 =?us-ascii?Q?T93B/cY+46O44ge/r+B5uJke6lQF1GCnzZQjLANWY23uUAMAQlK1BKNA+poM?=
 =?us-ascii?Q?jRqqGgYTpwZDzaUYpk8OubZTOv1e0lpETyNpLRQucpjo2EaOVhYDrDkW2Wbf?=
 =?us-ascii?Q?h2p01AwMmxyrbieXA3CZdnNkqDUZIy6jzLlzkh6c72AghoEE/+GSeM95YxYJ?=
 =?us-ascii?Q?BDs++HkiYq8YeC4PpmIfsEHRrJiaqAwabib14sPPxZQ4PSlAbfNw3bNsIhor?=
 =?us-ascii?Q?qHPjILv7hp1iQDRrG/4/3RM9du0piWTh831y53PGPaHKYl9of+A1zHKEilbE?=
 =?us-ascii?Q?H9jzjNEgfJ05ElOYFV4VSIuj6FhuadTMQwZzW3WIFBpu5TesyNUzQz0PXLAj?=
 =?us-ascii?Q?o1gLgjCb2seDJCqieT68Vm4RG9lLkcWy6d5rADOsYLxLymrCUM3WKI71j934?=
 =?us-ascii?Q?XNDjKQy6b/5kibZtpIbiXwbozBHI9/qoaCd6nKufFraPbUUGG57rJZkE875r?=
 =?us-ascii?Q?89/8N1VBuu7lDK9wuBC9Rvsu37jO6YwAfm9Ae1S1fbhT709+LYtvq8rlH9nr?=
 =?us-ascii?Q?hguLyiRpFRmEloOJI6843aTARRAIDackXhgQMkDaFBIDK9gL0XoH39szPjOI?=
 =?us-ascii?Q?km0SiDvkuest1HVilL2V275moexqIe7vTEn5WDJvE1Gxavl8yXrOx/upCW+H?=
 =?us-ascii?Q?yD2J5mx7Ky3bWPyzTBYl/rcnoi4KS8biZI40zLfPTohUCkV1hpKHWUZKx+pU?=
 =?us-ascii?Q?h37OdUrNY6ru+ibAI5Vz8ss//lNwf7omzRJwg0sJgFdkXw6BjjtY2GvRV8Xt?=
 =?us-ascii?Q?rtzpbHRvoj2K9sfB6tpGeVw7VLUqfIoW97pLo2hn9IxecY7XkMfHHO4/U7cf?=
 =?us-ascii?Q?Aw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4ZGNLETwjpNBPQrckVCcNadmjBOOFMQqr7Y1JSJDY8NpkXNI1HrHeZ5qaw5UcOH94f6LsrxCzFLfN6W6awyagfV+wr9l+KH4PLw2YgcXpp3YV+vb9fvWKJfDNEm8MVA+zevilvK46BDYSGBoxY7oz++pVadXrzib43JCu+t8DO6SS4AftYEBlXgC0oLgs3cgqQCWnrxeXtT3nXlmQH5Dv98ifV1SfRgzibsL+CimkZ4F+o4afdi29FDlscBEbRpUUdriKLPykz6iqV4ZAgEG/wpW470vp8fVCaPIs6XwkcjHQNL6KDLxUL1DYDEtE1etTLTybc1Ra9ITOM0oVfaS+gbuSFwDHukhYXcQQm3rSRo19cKmROABYe9yiOYzKjrki3LJELWReIB6o3ArVjuk8eEegn2P95VE2Wcznnbu1IpOQqyMDYlNpUur+SBqepQ8tTHbuYXmMZ8QzJ+VtoTvBSu+DS4HSzxw6TKPTQMNha/vJwLMBozFhJRMyrhn3fmPwj/UVIetkbGwoCmhGRN3M4J6qv6uqY/9I/5jy5ByfZinPHd6rssdiuSrw2+ZjYNZahI+hfrPV/tpKf9ItshvAYB7iaO2jyBY+U+4bortag8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4d20b84-ec9d-4eac-8c90-08ddc46be063
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5029.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 13:22:56.3118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1t+mwasnmMWpq2YtqtXvuTAowF0/T8sv/LiMI0+XRlUMwOhRvsG0gL8QLtiauSh8hp/aQCs3JdjnfVkTk+zTHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8180
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507160120
X-Proofpoint-GUID: sGDyrpWeD4JNG-NOJ2gMsSdatCWRnPuc
X-Proofpoint-ORIG-GUID: sGDyrpWeD4JNG-NOJ2gMsSdatCWRnPuc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDEyMCBTYWx0ZWRfX9mo1m6Q3nXuL goaVgJSQwyXZzlJzBD30RvX0u1DDITZF0Lebmg54rlOk/b+310qQB8jLCmIk0MRExyxpu7xT8pO /NZPHstK8hqdI+NtT6Oft5j6swPxMzNEw+3NkehIYH8zwLYYVToRK1NVtG7DMlv1GvISyh5LqKi
 hgGVwpKpL5HcSyj4Cv16LEvweDYrHAaIyo/S9K4+yxak6r8A0RtMzWV2xNNqbyai+XPBOdvXrFI rlyVjAUExQEFVY/0f6OxsPIBCV7u4N8zQgbB2ogst8hJITX1y9/0cAd+G5o9K6NuGnDwYvWXfLe 8ZCaZMPHaHBJE3gSilsp4aQBgJr2bqABwzt1knNVPAow7d8b+z8XIuGsxscOY85eslUjuxbtDxz
 35srHfh1yMoSKiMZHYtPKr48Rlo1UW3G7yHahWyyD9qB381XvSf2G2l+GZGtrmTPg41ZAPk3
X-Authority-Analysis: v=2.4 cv=U9ySDfru c=1 sm=1 tr=0 ts=6877a7d0 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=wfOgEm70tZVpwI5PgMcA:9 cc=ntf awl=host:12062

On 1 May 2025, eugene loh stated:

> From: Eugene Loh <eugene.loh@oracle.com>
>
> The multicpus test checks that data from multiple CPUs is aggregated
> properly.  Operations like avg() and stddev() require division.
> DTrace uses integer division, while awk does not.

Oops!

> for example, CPUs are not numbered consecutively.  More typically,
> there may be a problem that the profile probe is not firing on every
> expected CPU.  So a test failure probably was a sign of a problem,
> but that's a different problem, one beyond the scope of this test.

... is there anything else that tests for those other problems?

> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
