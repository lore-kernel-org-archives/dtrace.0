Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA8A1E213F
	for <dtrace@lists.linux.dev>; Mon, 19 Aug 2024 23:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724110480; cv=fail; b=oTbtjG/g/WLhZP8/uijTpQwQ2Ve6V32VeBP7O8+Vu7eDuqK8B75Di9UGEMUEizpb+PUoqrvgoiLX/Hs5leNCMyWBZ/obSifXbT8TpKXnPDMUyOhJCtBwgrC9V5O2OdDhRX8dxHc5UuyorcVvGFIh8AVLO4BhI4l719eus4R1eR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724110480; c=relaxed/simple;
	bh=iOcLETnQsmM3Sa/JDpW9J7Zbm4o5OEXSKj+r8S3xrb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tHGaW+us9zFROC2ZK6pY5ZApWSdQ8Hm1oLDUWLgD9fqxBccVY3wDTB5WkL8cafxCyC0E5lYwaZ0o6iefIhZgi5W/QNHWuFZG2S+sqETJD8+GqtPjFpRHL9YD6i+6AeV+O9kTYET1yGaFm5NU11YWfUNdrd1sqw1eTUNweX44RMY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OUKFUpjY; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FRPZYP34; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OUKFUpjY";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FRPZYP34"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47JLKHFS014726
	for <dtrace@lists.linux.dev>; Mon, 19 Aug 2024 23:34:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=G6CM72TUUkznIOh
	IRV6giRad1qrr/EbLaSQfD+zpWz0=; b=OUKFUpjY8K8rwlMVt8R0D6qDFaftL53
	VgK0/tuaqDH+MX/mU7L1rKRnPfynRSxaeBA8Is38jeGqvyV257ISuZQ1q5M528qL
	KV+5R9HMLTxJaGnnpVTWlDWjmVi/9PlywADgZeor7mrSrhfqTYZ4pOemmVEvwr7i
	jaw87YPbcNRtXU0FVQPhroZJbUq9RhM9HiFe3WaJ11VTZX23px98MNqnbLzbP0BG
	HRs4L504EZGSwC18/qC29HQFezmoXb991qEx38rEOoNgP1YY2YbMQOXLqaTrcaJO
	qDFu9vXZXyXm2KXl/iC/XpHluXCYhuXGIwtyCE1+UoVC3NACT7DwoAA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 412m6gbtg0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 19 Aug 2024 23:34:37 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47JMYnDu032781
	for <dtrace@lists.linux.dev>; Mon, 19 Aug 2024 23:34:37 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2049.outbound.protection.outlook.com [104.47.55.49])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 414eyehb37-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 19 Aug 2024 23:34:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DjPIh8ocbSrVJi6gL4+NlGpwvE5mSBUnvOvHbZaULTOdR5u8ItAaaU/CnGSgnEcbh3xVrzf0mJfx5JD4mlpjJGuN0+nDbbzNOOgOWzcRZIzS3fzxr//XZ6C+w9vOD7gRAJnyOQnNSc49pIsN731ROXXjG9YH4P9J+8ABxwJt2EuTO5waW2Q9m86q7kP5kzvmRDLFC1a9SWSBMnMiFD2dWJ7aGdlwCbcRrPf/HspuUXMUlyY13w1S7agT+psnkTKexuNOXu44nZ26AAeJ265qvqgoEnSQttn2cf3S46ti6NQ+5dqPV8hc0VcRcaputmis1IYYeUduK04nPXDuMw0r/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G6CM72TUUkznIOhIRV6giRad1qrr/EbLaSQfD+zpWz0=;
 b=cLH8VC98R2Z1DVzdgpePI/7/EWfVZXHNteYPjQ2LNT9kQaunhE0iJN2dMKOUmf+hDbE4uh8DbDSCOp/iR0qtsmgUnFFcYZuRkou/6IMTyZQNnTStrsKej+piA95GuLwZDZc/nK6mKcqcg6FHi32Zi3quK7gDxKNE5IMWOw0+JB+uom8Se0qcN+QqtaJnIR4BT4xWYS9dpxgO+SrGKyFTEOtr3xbEB5RpSYq6U24kZ/KjEQrhNfmrm5OPTGrSkDBDh2hDv24s0ArqVIoGtfNmTL/8lF8FgUgKNpAu2CmWPBqBrio2v4z7Ruo+jZbPB42Hh69ri58W5qcQXnF0Tl7ebQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G6CM72TUUkznIOhIRV6giRad1qrr/EbLaSQfD+zpWz0=;
 b=FRPZYP34EikP0NzFSHHYxvMweuCSOPBTv9hi/828YaeKop7rrJv6eTLnnxuP9ArA9R1o4rvE4NbvaZAj6wzLtZjmTqrrd3huEp3F8gmSLUbl/y3lucjJo9mM/K2FCcHhnfkTnvmswv04MmT2CLHHPnzXp2TMrDHH+381ULS+2u0=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by BY5PR10MB4209.namprd10.prod.outlook.com (2603:10b6:a03:207::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.11; Mon, 19 Aug
 2024 23:34:33 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7897.007; Mon, 19 Aug 2024
 23:34:33 +0000
Date: Mon, 19 Aug 2024 19:34:31 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 8/8] Turn some leading spaces into tabs
Message-ID: <ZsPWhw6bq5b9yuEI@oracle.com>
References: <20240604180008.11331-1-eugene.loh@oracle.com>
 <20240604180008.11331-8-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240604180008.11331-8-eugene.loh@oracle.com>
X-ClientProxiedBy: BL0PR0102CA0055.prod.exchangelabs.com
 (2603:10b6:208:25::32) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|BY5PR10MB4209:EE_
X-MS-Office365-Filtering-Correlation-Id: fcc8b359-2a0a-47b8-0437-08dcc0a77af7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5ulDzZ3PU6ESB6cU/AlAtanUkNlp7wuCZ+sFfQedmzddD50mj4et2XiyyUR5?=
 =?us-ascii?Q?XLWn6jweaEjOmGeiWu7NpcBiN+DBIVWN45Xw6IU18geBXV0VzuZQ0vU/GX92?=
 =?us-ascii?Q?vzPXyXnptbc8dAtMkD7EGeuZ4kno/TJ7FlGx5xiOXYjkqN2BQj7ngM6c9GGk?=
 =?us-ascii?Q?3QLxdnHHgptKqnVDuXEfh4zFSO9R+hiElUvD0cqWbooEZbt6+ELt+/2LURGB?=
 =?us-ascii?Q?b7wflfJCptcDjhad2hEv/6Dlxcy3PzXnQHrG8TKNs2zOWWSSltWcM2jQ+lkS?=
 =?us-ascii?Q?q1Xii1aZPC0WgX93uE0faYul/kSvlTdmSe9dQKzNel8QZ+A8VnpWyNrBsW9L?=
 =?us-ascii?Q?Tc5WvSZ/utN1P8OqUS2EMG+tqQIfiMODBJ96YkHcehim1DTVfzh2gbIJnlBa?=
 =?us-ascii?Q?IlCnj1adD5YXUNRRvC43J2J/BLY7fpb6IZLT9Ei0icBA1iCBGcn+mRXjbOBA?=
 =?us-ascii?Q?/9XKSklCY3q85ZP13IpJzvb+WQwO1yBPQMvZ0O0sTWCzat4XifdTGen4mDXk?=
 =?us-ascii?Q?wTXrRUJ7Hr7v6ZXl2tsyGRxPcijveqID1vdBH9i7tfebKTFasCHSBo/PXMIt?=
 =?us-ascii?Q?c5e0Fq6/0tjBa5fOkPyow8htRyJurpGLN/ydSxRzDLeDTU11coFeopYMXq0H?=
 =?us-ascii?Q?+hPng9ppwn7aB/t1OAWGoqKQWhwy0gXxgM02mGIrCvFDbw3Jd1NL/L6oyRDc?=
 =?us-ascii?Q?8N3+sw+HJsH9cTTNsfIUBkFiTLp9ZTCdDZXD7WOVoGKyairtWP6sTKlhFQtU?=
 =?us-ascii?Q?JfOQj4JbL4uLlZjksmxq5it1tyDBlbWdp5UzvTjvCICaUWfPljwKHDoK8MPY?=
 =?us-ascii?Q?HXS15S19sOxhrVaToVFfDlPzDKe8vxU7rdZCXTkriqIUVNZYwB/inYpKzPX1?=
 =?us-ascii?Q?Y1Kp2R+OwpY4Lg2iUBic30wDUB1tRal8ZuWn+FP5jinDQI7jpLJpnwd2xM9x?=
 =?us-ascii?Q?ZfLLvtCt4l4lp2IEx115Oe6DdmRmk1ogPBKf6HS/VU3+gjGHfV5IPy4Hyb87?=
 =?us-ascii?Q?XeHQifDRRNyIeegnTs+kgLL6N9EszKOKNZ+TkzlLHv7xYBuZyGUDe5zSbEY2?=
 =?us-ascii?Q?iCTOHjBPsm75QrRyVZoyr4AXGXTJ1B4RjmW93oJwWIigl6F39MSMpMCS931w?=
 =?us-ascii?Q?ApYIfyntobYO6KglRykVS8pDNFGZb2YNGxf7vsYHS4boz9yi9Lnxht9QlOkc?=
 =?us-ascii?Q?Q64ouKOeDv29DlYSBKweDvbYAtYC7I5twqHynWd0OzYfSPJJABuXDDLcKyxO?=
 =?us-ascii?Q?E7X+3ZA2vWJveTBveLxZ7WWpkKnBh/upFpXrmyNT9P0P4XOimLXfNNeunnRq?=
 =?us-ascii?Q?9gM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?u0jWS1/p7z1I7K6LGhIbYTLJ0HQhm9hynFqSZa4cO9jEKvEPWx4FaEWsERrc?=
 =?us-ascii?Q?tCBE/JEMPHjKk8yPAOZI4IXTp7fuMeQjhEgp9AX56eFmTkNrRGsVzStIlxa9?=
 =?us-ascii?Q?lQqXXelo1w7psxEIkYb+tUfFPgjycDHaipfYbpi3Vv0c9K/Tzo6rdMWUrE0g?=
 =?us-ascii?Q?/WDm5pR7oq74sHS+hfx+hT1LQKm7imEaJuquiSErfpAp5YOhgBNgOZSEGaG+?=
 =?us-ascii?Q?TadEvMin7faECmu8F4fUXi8Bc0WltAOQavDMHVcDod9QMXZu6newRsQjzBKl?=
 =?us-ascii?Q?ex4+f6CnjrJO61anrxwKzRC+ey9lmohFmd3BBmscfaRcZjLSkVw687OvZgli?=
 =?us-ascii?Q?mQ8wyFHQ525rq+hufnnbwoOA27uegmx8ECrot8tB00LLzfGE70nDdpBegVYR?=
 =?us-ascii?Q?egAcy27vyBifL8JKkb3Nbxo/AwgW90QFIF3ALOO//cfZ3+bPmT12G11W7y16?=
 =?us-ascii?Q?/rWdFstRfBJkMN9noBW74oXjY2wU58HwELLQMDg2HdDxLDmPkXQmemkfMccU?=
 =?us-ascii?Q?O8G2dpN0WFMcUWFymRWvkaRquzx576yK3PLhGq9/Wvx87KvPf3R724sNkvYA?=
 =?us-ascii?Q?m2MovLCwkoSVRxiWUPca0PitZG6WUndfCeFOLMjJuVNKIfKOq07mz9oL2TBA?=
 =?us-ascii?Q?SqmofiJ4zBavEoAEPz/m/YK/WFMibI5/sAyO14GYrqysr1Ezb/QCcbPwyjCu?=
 =?us-ascii?Q?gIOjcdnEW2mYSka6vYty+03u3XOPT6ZDGt9EsoTE4sN3sQ1hCqfQKTcXNrHg?=
 =?us-ascii?Q?/BR7vYg/c+qWRWEwwNkLqQXPA8EpZcGsurNVayeYKSaJ/lmzM8s0a0dKnNOi?=
 =?us-ascii?Q?5cEc8AfQRzP5TT/n4In15oaJWA6IM/32DSXcXakSjAB5qmunKYUdUrwUV8dv?=
 =?us-ascii?Q?mUYegUsQ1V06q6N6d02WcgGNoHPrGUT8BLTh4SiSXXABWnturkRtUUW8hoxc?=
 =?us-ascii?Q?4N0V76nI6vDr/q58dxO4m6usDjXQsoDlV/j9rUGbvTAc5zPf4re7GAyiAJ+I?=
 =?us-ascii?Q?hHnRCww7LIxRyQ7yrbTqFE2fQTB/LzYpu7jcjiWxPkdrT5dwxjXRnCExxBe3?=
 =?us-ascii?Q?73QI6EjFZ57LTKi15HQ8C92XhTVIIHevqeYB/NY+OPUKgry+GVZX6DDPaBfv?=
 =?us-ascii?Q?/aVTFOefK0UN7UIRnmwnIbemvm6geMz5XAsVF8HosbPoWRW1k2RYyq3/bb9W?=
 =?us-ascii?Q?iL38holfapkVOkGBHp47QZoDD2dsDE2PIJud+h2NwZ3h0Rb5lNw7/V5CXAcp?=
 =?us-ascii?Q?3z3bs96QM5nbf2NB/DrF1dkRozcneVku8akl9RpeQ3QsA5mUSjnVMN0j9aGm?=
 =?us-ascii?Q?UjrGcFBIL5tAfh3wAixDfM9UMx8mDpNNY1W4amuu4IhNNlyReoAtPIhWvZhA?=
 =?us-ascii?Q?ifIpH6vg0HwKAN/tJJJD5QH5FDyLZ92CQWnbBqyfecj9Sp1CYSrp5qEG29lV?=
 =?us-ascii?Q?gelfF+zoGK0+CHTUa9NbvpjQNs+/VMPnKua1mBqCPXgriYeGH8Y/+Xoj96XC?=
 =?us-ascii?Q?yPxj+lb+x5m0h0TXSHF3Vt6ZNn2T9KjOtHE6dIX+3eLEw3gMdWnrcovDAPU/?=
 =?us-ascii?Q?pqRDhshbRN9Y9/lQi304l2T/pamfnq0P3RalzRaXE/i1T2+cmhY8SxwquB7F?=
 =?us-ascii?Q?hQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4F8U2C2ZVpHtIQylov7QQ1bRjkhR+s1+jMHF44u3Ueh174qv3nHdi7eUAaBaJa0REYno4UuFOwBOoCpizf0pvG5Cah2/Ez5XlRipwRM0vpClOUv2HRvijn/8rbNmrPwNB7FIwEkQPcqA3kbFgqpApLVAmtesMHSePKBlfLB8tfw9iIT1xVNyazxzT9gAjX7tBkhMCRVClMv9OGtC7BP1U7HWcjhuPjqUD8gwzC8vBhD5PxZW6YEKwSDf1BwPcIRC/D8KvMUyY0DxILMFGQrgBHSrQ2zljwkqg0bqwV8R8yf3YSMAea/OZfJu1FyPrgcRQfNQeQAnan6M3p1aVrQb5fz0OUYRDyfMR2j15btVH+2pohgtm8q7oecLpFkWHAgYmuYb/u4cSdkMr17aytpcd7dHF64Hgj1npLrb8yod7rre8411Lvjd8lrY9mCtGECjA4TeZIJhlCxcWvvYNDJQODM7k1ddFT2e7TpbCRg42iV3nC0Vh8tFs1iu7Rry1ZFs4MefmP/6s+r8UtTCRmd7Btkf7iHMaA0sde9NcK/eDBBGt1+hsgLD5eedpwVryorkp94YEW5aoqpLkCPuxfEIy27LBXmu6tNlmlVHrcLfIxI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcc8b359-2a0a-47b8-0437-08dcc0a77af7
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 23:34:33.6158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q9YDDaixRimuxqn3pzECQ3CMsHoMsAEi55n4WneNhEx21FD8pa5wNqkX3LiMNM8snSCTyAtXkhcCHHlJlxtVva5GaDkLfaSaufb5DHVzLwk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4209
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 suspectscore=0 mlxscore=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408190158
X-Proofpoint-ORIG-GUID: _C5HSsiHfVGULxykvZYmR4XAEXRQnTn6
X-Proofpoint-GUID: _C5HSsiHfVGULxykvZYmR4XAEXRQnTn6

On Tue, Jun 04, 2024 at 02:00:08PM -0400, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dt_bpf.c | 2 +-
>  libdtrace/dt_pid.c | 8 ++++----
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> index e1a09215..71c6a446 100644
> --- a/libdtrace/dt_bpf.c
> +++ b/libdtrace/dt_bpf.c
> @@ -1140,7 +1140,7 @@ dt_bpf_load_prog(dtrace_hdl_t *dtp, const dt_probe_t *prp,
>  
>  		snprintf(msg, sizeof(msg),
>  			 "BPF program load for '%s:%s:%s:%s' failed",
> -		         pdp->prv, pdp->mod, pdp->fun, pdp->prb);
> +			 pdp->prv, pdp->mod, pdp->fun, pdp->prb);
>  		if (err == EPERM)
>  			return dt_bpf_lockmem_error(dtp, msg);
>  		dt_bpf_error(dtp, "%s: %s\n", msg,
> diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
> index 02ed7511..7c7d7e30 100644
> --- a/libdtrace/dt_pid.c
> +++ b/libdtrace/dt_pid.c
> @@ -905,7 +905,7 @@ dt_pid_create_usdt_probes(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t
>  		provider = (dof_parsed_t *) p;
>  		if (!validate_dof_record(path, provider, DIT_PROVIDER, dof_buf_size,
>  					 seen_size))
> -                        goto parse_err;
> +			goto parse_err;
>  
>  		prv = provider->provider.name;
>  
> @@ -915,16 +915,16 @@ dt_pid_create_usdt_probes(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t
>  		probe = (dof_parsed_t *) p;
>  		if (!validate_dof_record(path, probe, DIT_PROBE, dof_buf_size,
>  					 seen_size))
> -                        goto parse_err;
> +			goto parse_err;
>  
> -                mod = probe->probe.name;
> +		mod = probe->probe.name;
>  		fun = mod + strlen(mod) + 1;
>  		prb = fun + strlen(fun) + 1;
>  
>  		p += probe->size;
>  		seen_size += probe->size;
>  
> -                /*
> +		/*
>  		 * Now the parsed DOF for this probe's tracepoints.
>  		 */
>  		for (size_t j = 0; j < probe->probe.ntp; j++) {
> -- 
> 2.18.4
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
