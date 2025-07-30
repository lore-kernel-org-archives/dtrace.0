Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770E186347
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 14:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753885621; cv=fail; b=oPhaCLZB6hBDBULzm7Z6C90w9Ev1e/56Cn8iwcpO1sYRVlZyq83LWp2Ad1YdBRVskp9w/OrXv+RmUsLpTtYqV0QB6zX4S8HMB5J72TIZMFrAPU0wPMeHB5iofzxNVX/WsIa/75s8Z9EfNNgD+fo1SRLJpcSkV5ALsGReeDNDVLA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753885621; c=relaxed/simple;
	bh=6mmXdqLquOpy7Jx6j2nhtTL1XQ740icBm63S8RGeQfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RK77gmjHYz//SfoFCPqJAVTE7Yu/H64Czwl463pYSmm0qWPBFd0qJadJxOZ+7WB1C8wcXnhcMEXn7MWg/VLLAB3wWOKCCfOEUp1ndGwUrs5+w/SAZftAiHqtdf3IIY5kEgJD/3tJiarje9TxqAji38CYKbanCFn55DNFFpGvVM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SjlT0I5e; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=e76lPBHA; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SjlT0I5e";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="e76lPBHA"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56UDMuGh016995
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 14:26:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=8zZYxZ0/MWqDaxpEDi
	WjDkxq2qTFOMJ1ykXR5cL+k9Y=; b=SjlT0I5eSKRJqBDe3xQRpVDxPyb9XfSd06
	637Bj2I1KLjiKV/tj02WkGee8NSdRlmO6Z3u/rMyKK+CyVz+lH22wlE2DgqSPvcK
	ZIAK8Ar3wuslJeSUBnlEQ33JmFiyGaD7lFmXdrTuld8Iz4wA9QYkMgoO8Yi5TSPZ
	5epJp3CNZDKVoNrcbXqXEJ8lrhEm+jLpMJgBKSg9rh/qCikr6qC8rdM3No0S/YMJ
	VeLtfTCifY4XtWBXwRzH1XJryLdPO/XLTEy6PsH8GkMV/HgBCGgXj2T3AkrL7Rhq
	YyhbyvfgxYhw711BElqwfZ6T0lz/uejRLEojBVrdJFY4y08bnseQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 484q5x1vj1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 14:26:57 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56UEEIga002457
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 14:26:56 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2057.outbound.protection.outlook.com [40.107.102.57])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 484nfb9uk8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 14:26:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=enLI6/Nu3Gj/oU1UfLQVR3mP8lFtDhsfnLZ6KaCsPKwRhVY6Aa+O2PGt1zJiFBiTzV+YeRJ+vxf2n/eL0EpCtjAgj2KA2cQwUwvZUk4eU79El/3x6jj2Cl6jVo3Z1m2qUzVBovFORLcVZyfJW3nNpkHE9QLPSKVnqK9M+wFNyWMk2Z6OwA8GIbfb0p1pMfFQ6wdHuT5BHG0sUpnOtc829ey7qz4B2O1yvGVrNkR/H02v57LFT7uwUKAP9jgXLEdEFNKRiDhIqQV5Eia84TYyky1wbkVYCIpt+RVyonsiSrpWhhVKO3w90mUrYSMeZlmVaHtP/htGRAUFnIYGd0iqrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8zZYxZ0/MWqDaxpEDiWjDkxq2qTFOMJ1ykXR5cL+k9Y=;
 b=dcWsZuJoRhmquYLmQPnk58bRv+ANG2q4+utMmp9kBbLFsHjsS32bAWCg44K4hUCGVCXAx2sD+Dx7KvR+SKRbBGTyGvS2d1/H6lIRBFeauc+3U3AlkTAc8bfDCjWSd57aThYBTH8e9A67WvoU9uM6SWLk9DpBGrSdVOxTwHVuldEs3oKWZm0Jfnya1TPcoLvnSf4tNQHMe21pbH2mbUFrd6CBxUFSgig9YEaaRilScH1JNUj0zbrel8HyyAd5XmhvIJAfCny1VRk5bRdaOz759BQEmHRxbsKR4zVoWa5M8GgOd0mFDYDuIbKnfL0XE1Zbe3sxOLwhDLWTL49UCfmvAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8zZYxZ0/MWqDaxpEDiWjDkxq2qTFOMJ1ykXR5cL+k9Y=;
 b=e76lPBHAwOt4LUlBjbk0bgWvRKhcItCofNEiPSbOh6YpH0qbi9bizj/H93XyNDkbDX93fvGVjWF/J379GXF8dNJBYGkAT5F/73322RVwAXSTmJ8Cwlim55pOBrjZY2j5mKkW6qgE5FmMURMYX/Ume/f37V5+u0z9OKhdzi96RXU=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by MN2PR10MB4192.namprd10.prod.outlook.com (2603:10b6:208:1d9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.13; Wed, 30 Jul
 2025 14:26:52 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8964.023; Wed, 30 Jul 2025
 14:26:52 +0000
Date: Wed, 30 Jul 2025 10:26:49 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: eugene.loh@oracle.com, dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v2] test: Wait for output to flush out in
 enable_pid
Message-ID: <aIorqcS0sGZ0UuHS@oracle.com>
References: <20250628223050.3396-1-eugene.loh@oracle.com>
 <aIopqYJP3yn8DzUf@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aIopqYJP3yn8DzUf@oracle.com>
X-ClientProxiedBy: BLAPR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:208:36e::22) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|MN2PR10MB4192:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d4a6c45-3c52-49ba-43fd-08ddcf7520b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8n+0sYABdMM71ZIMziqZjHWTVqe+DvGIMbq+rQfPU2ZRK3Z08BKxfSU5JkF8?=
 =?us-ascii?Q?qmsAyJZuK28Cotc45aMUAZ2rI72aaUbL3OOP1TzHPxlfClZmCEcEqCR3bmtj?=
 =?us-ascii?Q?pZrF3ATnl9nAWLITmvjNykIjB7jfAuFFDE3MHvm5SONP3hOFM7PVZLHAJ1az?=
 =?us-ascii?Q?2UDZme+qiL6XPjPN66D20C3xh8EKZb+KCUkTIOt9pbEu+ireqqGDUdPLGnL+?=
 =?us-ascii?Q?oGes+UB/hM1v2j2i04b6NDw2QkqMqnpWSius5JRKJvQ89eUqVi2TaTc/gTP6?=
 =?us-ascii?Q?S348vrjbfFw8zXowAoHSx8pCzBSNiYnw6RqOaQPHq2/hBk+CpFSNxr+1/qRl?=
 =?us-ascii?Q?UsMPG1ou5IHMgIGj1uflGM+FIIvrXx0CRMDxNKgj6uqU/v2OmdC7qCIzsS75?=
 =?us-ascii?Q?eEhoFWHNYqsM/IC8jjJbAZwbCk9sv+w35uwLTXAx8H7T0LnSr9G2LFQFZyFI?=
 =?us-ascii?Q?H08obOuj5LJmmc4qhR/4XdaF4ayVa1SK9nDvJ/E0U6rRH3XUqHYVQ4HYwAvD?=
 =?us-ascii?Q?GfyyLA6QLBdTnnOS6Kn+/E31JZiJJdjT3CSmwnPX9RYjtyh9+TDpX3puMp0P?=
 =?us-ascii?Q?twj1CXomdkmcqfsOWe3osiMqtvWwriGUZQBUEgWKRA1glJK2YBFg3aI+kAA6?=
 =?us-ascii?Q?8D4mPS4FPtY2nielvnqsIb5PNQxzLn7GJqoPQw7RzGezJ4HUvi7+pPDVDV80?=
 =?us-ascii?Q?5yYAtCX4WYDLiGYp7rDNPAtYL/5htAl50MXHOSL9M5Rpqxb14WV4rmYnJsjv?=
 =?us-ascii?Q?cZjc16vSShMnO8WSGpGfU3akpbRyqHVfpo4KOHndDLeJZFUo3hdElUCLSLE5?=
 =?us-ascii?Q?6kmjrQsGCvOGBDr7gGMY2Au18HH6M1iJup5jtcuMspBpJ66Xe3ljX4y5z8GH?=
 =?us-ascii?Q?6d3OjV2Q0Z8Gx4rGjRmE6Auwxn/4+74UFAaFAdpovGt67YX3aEuyenmTTree?=
 =?us-ascii?Q?HozbpBcQK5fFi3eAYJV+yWXzl0nHjyNQKSm/w2FgpPKDyrW1LLnPebs0t/D5?=
 =?us-ascii?Q?SjCeo3w+K6geJIF+B0N4UAlN6pTkDRa/JHA+CcZymUAYt2PmpTm9F/eR+k0c?=
 =?us-ascii?Q?Q/RwCYGqU3KgQxfqHdkwBTafva3wt9CI3aVteKjZJigv0rXhzcoyHpTJhHze?=
 =?us-ascii?Q?UbpHbEswNwqw6DQK+gMAQHTxOyCcCYODzKHbFJbLFH1+LoxV/CoZm2xYOajW?=
 =?us-ascii?Q?dR5eMvXCWPvyY9PX20YXzIkI16/nBBIwLGv1asFwtAF8zm3X4P4uBvrehEQj?=
 =?us-ascii?Q?TtHCPx3zSDDMijtSJhY1NC2b8rsJ05sfqUbEQUXvOmQDLrbXMaFH034bukEJ?=
 =?us-ascii?Q?rG4cPp3Ie4qaE0TKJ/X4e4Dt+DxWz1S3wObaTqf7fr4OVQQD2W1dvRFfR80o?=
 =?us-ascii?Q?4NEcXbDhKGqemAEO5B0x2oDNWcfG7QE1Q206IKOd0WCxKPoNqQdzEN1kg55G?=
 =?us-ascii?Q?Ntx0F8YKofo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SlwKfFMpRHtjYhN9TwVixy9bFX1z+Y3l1Y7CGTM82gQONfJ0/4GuhWbM0qUH?=
 =?us-ascii?Q?ta78oqFuQnRWJ65TupHRMsc6gnxPhAhJg986KFx716EX0+xenbZ4ZAdFNZGe?=
 =?us-ascii?Q?6XUVlBPHyDVOE9fdddwtBDK1ZpIaAqdAfKKLI0x7XQyGdL+6HLb9GalAGg9Q?=
 =?us-ascii?Q?AeXPp2uzQAYB9bLQVeq1ztRmQnNmSrQTqs2On/nGB0tzajpAutLcZhLfgr4Y?=
 =?us-ascii?Q?odkd74Oys3LLKpNy8VfyU7AdS7E6yzBrWkCxL7bAMq7agBaRtysiPZzQKnma?=
 =?us-ascii?Q?HObMo283pA8th0mUtX9urIQrQtoCQRx8HtWvpuWiaMOgyVo98DaDbJEeIUka?=
 =?us-ascii?Q?UTsdBOmeTQ7R1TBdSKEqoz7tSEJftfHZIXOnmJMvf4YbeFGlmxEbJ8flKC1y?=
 =?us-ascii?Q?aC6xKcsub/RLOAxvvSmF0PoPkxD1Gg9knM5L+SgGgu6xlJyduJ6MTHMhu/ao?=
 =?us-ascii?Q?dvQ/1WRPzCLatMnXOKvPFGLRhnMOPcjpNDYAsgRoiGYhqlp9xd1POR+/Mur5?=
 =?us-ascii?Q?xJVC/z6ITeZ4wJgky+QuSb3ZmuZclbLCwZMTX2LsG9PJJ9teSlnIg2aoFpww?=
 =?us-ascii?Q?43srgyea2+/G+bWz2zzK6FDD5GZ3nThkuRu9nF2mbPjNqAAyDqdTfdjl7vsW?=
 =?us-ascii?Q?WPfLK/V0w9DeeQAi1NRX09gv/zI+8K4d6aaNG3A26R8+C4xkeO28mYgfeAKy?=
 =?us-ascii?Q?2mMiePTg7GMDj1Ye68UB8L3IVZHDnCcQj5RdebuQKarznm6g9zl12f9AoDk+?=
 =?us-ascii?Q?voaViYobFi9DIeXSa1STOg/c9MQ+9L9EXMLzXECqIYYDsbfsqP92UyvMoNlW?=
 =?us-ascii?Q?8DD8w8Pi+pnjlEyF5/bIEhuRohYHWek9VHFUGyvuFDpz5fnjjVKa26KHAew4?=
 =?us-ascii?Q?wfKPRJ2j3m61aRTnDuuCH5p0yuWtRkrr8CqyzaTK2G6hhXJi8uZD1y7H6SAi?=
 =?us-ascii?Q?J3BmFE7cy/LbLHyuPDS3ao2C3bdYCOLlcOfVNmHJ9gmwGunAvbDlJohbypU0?=
 =?us-ascii?Q?X+q+HBQ4pXq64IFu40Ha6M05pEbxZuKDpfYvzoY58Y6vEWvig/7q721O3hSF?=
 =?us-ascii?Q?63ZVblrQ4CBxpZ6O235C7G5TLozS5UBSLG/4pOD/s/vhC1z/EthezxRaBjbu?=
 =?us-ascii?Q?AhZtCY0cFqbI4gDG2RDQ5jGXOUCL2jZUnRiA/KHSAqwnkbC/CRBqbymaOC+o?=
 =?us-ascii?Q?WBUl8xb0GucZ/u7ycOyAW5H4ViXPIdlIRiGlONJ5Fmrab5E0UQC/fHn1OFJZ?=
 =?us-ascii?Q?C9QAge0vguxIo9o72iX5z2VxjAtQ+5lbIjn+2FDsP2XZk6UauxSyMOxXfrXc?=
 =?us-ascii?Q?jOEJqQNn1mXUn+qKP3Y+rid41NVvfQD/1x4omOd9cH0zkSX4a8MMJUZSqpFy?=
 =?us-ascii?Q?FgXNgStLL+rJTVCeGXVFUorKqGNdzQjiPi6Gy9oN2N9Sf3EEPkQd32DRFIYh?=
 =?us-ascii?Q?kupHTuY0jEPAJIeXXv3SiQZrDPceBtsdqJg6CwhCqHRbCtJOos/g+jhtZPxF?=
 =?us-ascii?Q?M89l1lqCZjUhJBcaVH2h+QvXAv/a8XomFetgymtamJLnNMzgfJ7Ces2lGUYd?=
 =?us-ascii?Q?q7/jbgxDIcFxzcir7arjpT9EITvvLe4oBR0QxPxtWk190Rd9G/DlrkdQdAu4?=
 =?us-ascii?Q?zw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+eeNSnV9gIcbO5pqEOZYzGoVYZF3c9iFnLUw7ZM2xKJG3tjp14WFLKlu/dlZ85JtEDVx99DFBJQwhebM3ANlb+IN+FJX3M5rc9OaziWg0yQu1c5cn+EcM4KPnwU8/hbr7mfwrZ1DQKW6TOAwL7EwXzIUUSFjIcBI9ysZqYz+/XyUKkD9cvpNIyuXfW3V29rA+q6BjvrINPtgvn+bKnCjfbuBgbr7bPPMu96OrNxEbt0y9JiUIs1bTx3i5+9EMqldaV+sU8rL5lnQVsZ+WJ5kNjKoJUXOjmF6ISdIBMbPHxNwxAQZu2oOjlhD9ZMA+ZPTvCW7QhVvtyPUqAsFkfgyhmBz08MU4ElmUBM0Ozn+x/LtqvdKrheBHXuD3qJtYW6wq2iJ05iVh1PHXZfmKV1rnmxEQApqMWgvls7eTvbt5H6g9vjI0yQyXDQU+5IFvutnP1gF9RX7v3q7QZUJUBqjRGj5ZXoIGJpLcU/HVNErrl9SzMOXT4WgsDfs1ZKqpnoCuALVOtbkM3M0d/Uddgek5YRRWUmGwDM/vTWlxyVB9/Q+gLINdJ5IoF8U7RRmi93RRoLPy5j18TnPv1wx/1tI9gdL5oc8SjN67rC1euedvlo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d4a6c45-3c52-49ba-43fd-08ddcf7520b7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 14:26:52.5208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C69hTBltk4byfHw0V0K7gFXHUeoN3TlayyFW7pkYIpw+J6Xrv3H4pfxSVj9ofTGthIuvQyAdm0Ofnun3cXEu+Cn04pQYVq/TgAErlaCqyQQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4192
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_04,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 spamscore=0
 mlxscore=0 phishscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507300104
X-Authority-Analysis: v=2.4 cv=X+lSKHTe c=1 sm=1 tr=0 ts=688a2bb1 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=m3gQw81XyXJXhSVli4IA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: 8-EhcjDNR7pNzu15mjyssAFQbrqwxfNg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDEwNCBTYWx0ZWRfX9Y30Xk9aLzry
 UysAnkrv9s6bxkNg/3my1k6iU5A1XRo+wTOUmtW6mtu/tpUnGJAykZJ601QzLz8TRtTushZT4dm
 X8fJeARH+HnG3meF+QCoo3NoLQEbbwbu4ouIs+V8ni5rZ6rYCmobkcF/cZnNYhRX5oKvqQYjl6k
 B6jNTGfzs/wA0Nq9K8y2Z+KvNitKJ57+on+q+FQPTlJkPY7bVSxPtb7/0BwHmA4TmuvzcfPBu10
 IDWhE0QB4BIIFAGxnNLQ9UXlr49+hIpjwH1Y1O/wgvYSwaYD5Qtvl7vdj03E5+BIOXM0yBZp8XO
 e5+ADuhc6MBpRKUV1AIQcZu3BcG12pmlNiDa8BOM99FN3j8/SELMBW7kmc6gckdvPyCzKYn5tZw
 dlsSAMv53WwBse1l/prrQqms3oKyuY5W0b7eUjPB7D7QR8NSLy0RbFA/WQAcNAqSweZ4GsiH
X-Proofpoint-ORIG-GUID: 8-EhcjDNR7pNzu15mjyssAFQbrqwxfNg

On Wed, Jul 30, 2025 at 10:18:17AM -0400, Kris Van Hees via DTrace-devel wrote:
> I still see intermittent FAILs.  I wonder whether there is a potentially unsafe
> contruct at work (see below).

Hm, no that does not fix it either.

Eugene - can you have a closer look at this and see what might be going on?

> On Sat, Jun 28, 2025 at 06:30:50PM -0400, eugene.loh@oracle.com wrote:
> > From: Eugene Loh <eugene.loh@oracle.com>
> > 
> > Our luck with this test has been quite good, but it sometimes fails
> > to show its last lines of output.  That is, we send a USR1 to the
> > trigger processes to set off the final output and we immediately
> > cat the output files.  If there is any delay in handling the signal,
> > the last output will be missing.
> > 
> > Have the processes terminate themselves when their last output is
> > flushed; then wait for those processes.  Also, skip testing altogether if
> > there is only a single processor to run the two, hard-spinning processes.
> > 
> > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> > ---
> >  test/unittest/usdt/tst.enable_pid.sh | 17 ++++++++++++-----
> >  test/unittest/usdt/tst.enable_pid.x  |  8 ++++++++
> >  2 files changed, 20 insertions(+), 5 deletions(-)
> >  create mode 100755 test/unittest/usdt/tst.enable_pid.x
> > 
> > diff --git a/test/unittest/usdt/tst.enable_pid.sh b/test/unittest/usdt/tst.enable_pid.sh
> > index 7f4f68698..296cfb382 100755
> > --- a/test/unittest/usdt/tst.enable_pid.sh
> > +++ b/test/unittest/usdt/tst.enable_pid.sh
> > @@ -33,6 +33,8 @@ EOF
> >  cat > main.c <<EOF
> >  #include <signal.h>
> >  #include <stdio.h>
> > +#include <stdlib.h>
> > +#include <string.h>
> >  #include "prov.h"
> >  
> >  /* We check if the is-enabled probe is or is not enabled (or unknown). */
> > @@ -41,7 +43,7 @@ cat > main.c <<EOF
> >  #define ENABLED_UNK	3
> >  
> >  /* Start with the previous probe "unknown". */
> > -int prv = ENABLED_UNK;
> > +int prv = ENABLED_UNK, nepochs_left = 4;
> >  long long num = 0;
> >  
> >  /* Report how many times the previous case was encountered. */
> > @@ -71,6 +73,9 @@ static void mark_epoch(int sig) {
> >  	report();
> >  	printf("=== epoch ===\n");
> >  	fflush(stdout);
> > +	nepochs_left--;
> > +	if (nepochs_left <= 0)
> > +		exit(0);
> 
> I wonder whether this could still cause some output to get lost.  I would
> actually move the conditional and exit to the end of the loop in main(),
> so that we check nepochs_left and exit when <= 0 outside of the interrupt
> handler.
> 
> I am running a long sequence of this test to see if that helps/fixes it.
> 
> >  }
> >  
> >  int
> > @@ -79,7 +84,7 @@ main(int argc, char **argv)
> >  	struct sigaction act;
> >  
> >  	/* Set USR1 to mark epochs. */
> > -	act.sa_flags = 0;
> > +	memset(&act, 0, sizeof(act));
> >  	act.sa_handler = mark_epoch;
> >  	if (sigaction(SIGUSR1, &act, NULL)) {
> >  		printf("set handler failed\n");
> > @@ -172,13 +177,15 @@ for pid in 1 $pid1 $pid2 '*'; do
> >  	kill -USR1 $pid2
> >  done
> >  
> > +# Wait for the processes.
> > +wait $pid1
> > +wait $pid2
> > +
> > +# Dump the output.
> >  echo done
> >  echo "========== out 1"; cat out.1
> >  echo "========== out 2"; cat out.2
> >  
> >  echo success
> >  
> > -kill -TERM $pid1
> > -kill -TERM $pid2
> > -
> >  exit 0
> > diff --git a/test/unittest/usdt/tst.enable_pid.x b/test/unittest/usdt/tst.enable_pid.x
> > new file mode 100755
> > index 000000000..9506674ee
> > --- /dev/null
> > +++ b/test/unittest/usdt/tst.enable_pid.x
> > @@ -0,0 +1,8 @@
> > +#!/bin/sh
> > +
> > +if [ `grep -c ^processor /proc/cpuinfo` -lt 2 ]; then
> > +	echo test should have at least two processors
> > +	exit 2
> > +fi
> > +
> > +exit 0
> > -- 
> > 2.43.5
> > 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
