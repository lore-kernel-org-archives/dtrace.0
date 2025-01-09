Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A9B2B9BF
	for <dtrace@lists.linux.dev>; Thu,  9 Jan 2025 18:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736446732; cv=fail; b=dJhJhMZDbezAosUdIyF5JUmm7X70eMX5noOHfs0HUGDklKl8OPkrhqRcNpsKhyNygwcagq6zX5dtcvNq45XK8JlP3rwtFVoYH18sXB3Olfa+R1AaD+u2u2YnTaJpdDk09PUCaiyKuSmDkBMtZU6x/DRhUO8Cml0iaNjl4v+uDRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736446732; c=relaxed/simple;
	bh=SNEruj+x0tIRahNYZXgvYJdqeD+pXbzrtQmgE52yxjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Uz8z6w+6s/MN2VyRBOps1toLtWapY6NA+A3E5LY8QeAfJFPtfUdMgMMvMyOvsqiRtV4I2itI89cN6V0/KYuKyKib/A7GNOr8Q2TTdmdJmMjcCEBkCYytLMGmfPYU5xzXRxYJ/rJLn4AVP6STfxG4Yb4bxRNwxH/ebgypYv7+RBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NX1TUVWz; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Uxf/0Z+b reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NX1TUVWz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Uxf/0Z+b"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509GXos0016255
	for <dtrace@lists.linux.dev>; Thu, 9 Jan 2025 18:18:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=j+K5CGSF7PsaPnQewTbcfC8rsWa8Guc+jqBb/0QbR4U=; b=
	NX1TUVWzfEEMHCC1n/bbB4aYoFQgxvYllhuDI1paYCnj2sTcsrTW17eBNh4Dp8v0
	E738myhJ6PqwAE5xmiEpNOoeTMLeE8w/oUKDy/PdTkHPBUzLSeL94jMkzU8UezzM
	h1lZkNPzcHNJUTzIrb6dRi3Yz8JOF9G3otF20ZXX23Q7PKZS+7LBaXQ5AKNrwqOd
	aB4VHJpgnCSgEUCyULvIa9rhQ+q8dATpUCNmwN1q4zDcec0h22lGdWBRcagWSwhp
	vRWVcPdnc/gFhKTVZzhiBpNFMX9mkaLB6Z5AwvRlN5n16KikAHgPyvbh4EjFi0C1
	zhexrvyTSRacGjv4YzFrrw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 442b8uh0xd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 09 Jan 2025 18:18:49 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 509H64rG002848
	for <dtrace@lists.linux.dev>; Thu, 9 Jan 2025 18:18:49 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2043.outbound.protection.outlook.com [104.47.73.43])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43xuebej3k-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 09 Jan 2025 18:18:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WjlZFBAOhZCbohgmYp5xYkx8HVHXpwCpj5T3BOooZ5vrnbrD5UccQNacXXxmmDlqM7AZhOnELeA9bG1AHz0gvGwRZbnhPP+/J6bYKWRYC4i2GpS8VOA5EWeFKDPeg5QK5UHAXV3Ay08ZwEKZUBNuEZPaOPBm6coo3SFLHgKjoMj5PrM+NfSLfnxRyIRLtZyUAHP0rRBTo/JRn7uHIqcOL1PyaeCW1MMEMGqnebbSWz0XpFeIsblok+hIxeqmgcEe42We2j6n4BIFz6nwjyvWTL2CuSIDmsM6Z37iDlf2+/bKHKJ/IFc5Va6AnEEGJSzd0C6xjxsEqqfxmwVx3qiBSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X5oll9+wD6DM+PQFD3jzaxKaIo7x7Sc53caNyyWWO6g=;
 b=QHkwd1HQcdY3G94lWBoIoXO807XuoM+fUZPH2cpEGZbYgROykaK5RWGtz40Jf3GP37m69N5oDzHuNKrW32pSz1pZ7SYbLMSrOnwFopneGs1qaPqjcjHT8lGG82w8ysFFxb0CS+XHs1reV78gUmSDtiKBIn5mcD1o2M1Cf2mApuoLaLYikr8kx+X/oeQ3iQBQWV9Rlv7SBsdfxNgqT/7o2ZkSeyhSingciMojcT+FVj32osiXhXnSMp7MDnGBGcFwXJJxGoTAlMKERqbFhuf1elYso1RTAUVcpvEXqT1C8h2w1x4Isj6rNUSfJHRPmPNcEQY6siQP4gCx7UUtYreuNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X5oll9+wD6DM+PQFD3jzaxKaIo7x7Sc53caNyyWWO6g=;
 b=Uxf/0Z+bON5GOGzVQ2KpE5pKUP3OWaiZ+x14YyBGg3aRnyVG3O492gVquJ9uiB5Q16wA2a3vOmIzbH+GDJFgobUYRBuugHrGnVmJlXRtk2oBdpEruaD+TKy/kstx0mmU4GsAP6dQeuVr4KFrm7po7p0LEWNozsJVOBtlrpcXj1o=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by PH7PR10MB5879.namprd10.prod.outlook.com (2603:10b6:510:130::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Thu, 9 Jan
 2025 18:18:46 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%5]) with mapi id 15.20.8335.010; Thu, 9 Jan 2025
 18:18:46 +0000
Date: Thu, 9 Jan 2025 13:18:43 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: Eugene Loh <eugene.loh@oracle.com>,
        Kris Van Hees <kris.van.hees@oracle.com>,
        DTrace mailing lists <dtrace@lists.linux.dev>,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] io: adjust io provider for NFS tracepoint variants
Message-ID: <Z4ATA2/ba/7d9+VT@oracle.com>
References: <Z32uRw0BCaUdtVFm@kvh-deb-bpf.us.oracle.com>
 <474ca7db-5d3c-0426-7b17-fb04043544c5@oracle.com>
 <87ed1dh73n.fsf@esperi.org.uk>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87ed1dh73n.fsf@esperi.org.uk>
X-ClientProxiedBy: BLAPR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:208:36e::26) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|PH7PR10MB5879:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b8838bc-01e3-4d4c-2058-08dd30da0e7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?HfrWLmIP88AhGYN46/bj7xs2KyQbh/Hpske0RvYxbx1cxvJsMSgjPuCaMf?=
 =?iso-8859-1?Q?d4pTBPPuv8Po8Wz2Nu1XE1dUmiAZLWL6JHw/7BpNgKqNMUlTtbZYpKGSMn?=
 =?iso-8859-1?Q?+jSkG9etEE/Bvzpcg68nLSNjjp2XoJNfqrHHDfWZQJ9tYek2j9XkcY7DCb?=
 =?iso-8859-1?Q?OuJxPBBCNuLph8e6k8HAGySmN5t1xV91hzH3tyep8O4wxCSJ5hnu+G6RHn?=
 =?iso-8859-1?Q?KXoGnpNAGvQus/472H9yyUsluy9K/Ajt6itgpv143vVjZPPMWes938+QfT?=
 =?iso-8859-1?Q?RetdbjjvbiFGV5UlFCB8K/q8eb0MTbaR0Yf57BcZI9el4x9j8IPviRYvSH?=
 =?iso-8859-1?Q?g+Qx/6i6qLXoKrvmykceN4FO9rhQtfayGIJNHsy2ugkG4uDNVDZHMngsBn?=
 =?iso-8859-1?Q?qpoZc/6Z1KaLLnEYkSSOF2MZNs1HeDF8au+Fg0yw+BU4Yp34iF187apUfV?=
 =?iso-8859-1?Q?eYhXM5nDFSzqfMoKMH/ffM4wvaaAMrRwzH9tPmjYH2+r8A47v1H+SrQEiA?=
 =?iso-8859-1?Q?wKsGj/r1r/ojgptAbL/HPN5Ai4V7upbK6SYRuUevyZNu9072iuJVAs1yWU?=
 =?iso-8859-1?Q?ryBBfohjnL7Z0+bGldo1egijoHkItmrDC20lCBUCnTFjU7dbMY1ZuUQ4du?=
 =?iso-8859-1?Q?pU4viQKRcmhjC6TruBT1GOvcLQpHXDwEpBc5WokhReQF1x+bLxprJD0NuJ?=
 =?iso-8859-1?Q?l1kSZoOQvCUgSjjiFNyu3wW1eUzlMYEJTs8X9KpTwcP9Wvf6VsfEe9Sxmw?=
 =?iso-8859-1?Q?2MDtpk8Z7Xfcn1AiUDfsq1n+SLQunbkD5g68eI4LerTwn0XX/GDSvtFsnj?=
 =?iso-8859-1?Q?Wp4kzk/h55/23GD4VTALzzD4a9e4/gwBalhaWMYictlsBbca29lpT2PhpZ?=
 =?iso-8859-1?Q?iqdXy8Oy9tLRUN4fYgo1Wns6Kj1z9eg+CzxJmFBJ+1bjn+xwbhqoCorcyd?=
 =?iso-8859-1?Q?2OQcBk1hKRofstpPASRLywHV1A3s5PS5z9wtD8i//xPrw0rfX8sZKlfMjh?=
 =?iso-8859-1?Q?rq1P1lSapqUdvDdGkZI8J2lpCmeu7MNKlVpoOf1mBHlbv8O2S/0f6kHZO+?=
 =?iso-8859-1?Q?BgCE8+07VL5q8gOErcpTHlKxDRkJhAe8WDsnuN0beYX8zuEb2DSAYSk5m5?=
 =?iso-8859-1?Q?TNAqynz9t6X1GEweOdCbE8oybAB0EwkecW+pLpsI2E7RlRmCnso8zeQq4N?=
 =?iso-8859-1?Q?p6QAPoyukXJxWhM4ij09qsqXSYvuNdqMoyCtNvGu2Q/c4vY1fCXkxrY+s+?=
 =?iso-8859-1?Q?kkLmwfXdhKk12RaIxjQT0cy6Emm2K+Yc4jifH8hg8AxwOrovYPf4NwEBDg?=
 =?iso-8859-1?Q?hjAnsGZ1VguGThWknCr3tnFVuFi/Osf5p/iIgb/MIui7Uv0BXPlYlLJMgU?=
 =?iso-8859-1?Q?F1Ulr3mAq4Np7Hd8DorvK+1eUrQoG5zaE2U++d8allvkiSPr8OUfz3SSiB?=
 =?iso-8859-1?Q?g/3BqhZW6YJkbe2D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?diqV2AEuR8iprNZKeRrkSa4pskSnNsqV5izByaAUN8oxTVXk5sYliqN4GK?=
 =?iso-8859-1?Q?ISUEh3ygXPjnxEwZcWSr8yXA3CRabTyAAuy6Uh16ALTI3ENIkbO2KIFkKo?=
 =?iso-8859-1?Q?YfEm/brD/TVCkg2VZg3oT0uA0i8lwGKWI4tRAMbLH9iMNa4RGHxHj/fCOk?=
 =?iso-8859-1?Q?xEOUnMjuKkEJEUyo5OGZYzb0a1f/ul73udqGjd8prWUghxPh7pOwuaQHTp?=
 =?iso-8859-1?Q?6bvoRgpaBDu1E+E6ZnL2ZuHQMG95SsFfj3TBZjEEnyywBpbh4V1pQc9kPO?=
 =?iso-8859-1?Q?+BzxMUzj63Cum3kOWe0F2UKe5z1pP1GkJKojaHvP4LvtcC19ECMFKj84QN?=
 =?iso-8859-1?Q?2/KCI+Sa8a/r2ndcCECdIco7Hw51Nai0/BLjd4yHPv7ciOZXArMkz+ti5M?=
 =?iso-8859-1?Q?ZqbYTvU0bc1F4F3b/Et3ta2Bd6RqDW90ALW/gn8R2KwejEgkxKKiQrYa4b?=
 =?iso-8859-1?Q?ZoRJ0JTvxXa7RWlUa9Kv1RTIb1fmtFBmEmnf9gWWoBOP3h6KVQyKpvSySg?=
 =?iso-8859-1?Q?T6MzwyMgW1Sv4u6yY7OICjPQb9UIKdQw52f2GdiBuxz5ccArtBuAmhsAxW?=
 =?iso-8859-1?Q?gsbx0h0JGfA6p7McsODih36EpbFLU1zMaqxSZc0GhTzfvE17UcWBp3MzqQ?=
 =?iso-8859-1?Q?iDCn7lZrNdwBEW5dQM5cyzcTJESXSb3yfIx1mwMkz1P4zTSHZXrEQE6TFQ?=
 =?iso-8859-1?Q?iRsemf7wwke0D7GjwjzNFVs2YBzZ7R2LzSmntbQlLaUYjszRtQ09HDhLNf?=
 =?iso-8859-1?Q?lFC1ETjn3o0z1sBq6GPrzlbMgABEvfAHHarh0Lgp6oGj5qcXcKhuXy8kOw?=
 =?iso-8859-1?Q?YNDhcFCOYVdjLosHcR+ieHL+42YgWFDRTqQ8IRWw1z1kEceq814PohABGy?=
 =?iso-8859-1?Q?DI0p8jjd3RfHKd/BL1CSh9oEnjBXgGDH/UCn91CwckmaYqqwb/Wk4n/2Ac?=
 =?iso-8859-1?Q?S88LgWO/2Mr4N2I/cAyxwta1+IqmtJmuiK+m6+qNDPMw9QEFra3lQ51pOx?=
 =?iso-8859-1?Q?so1mxAXjmzby41P1UtAWSGgyvVmvfgtNixV+nWw3sZe/nCw1MHxyuysain?=
 =?iso-8859-1?Q?MDrebhVNqsJpcf1yA/OiKGWC1/slwShth0cGM7RFZr6gcm62VjOgdifWAy?=
 =?iso-8859-1?Q?tlJMEhVlsKE3pxSDP/+JHV7mGET4oolHmeCFFuWLzKtZGZdWAUAWf8DaGR?=
 =?iso-8859-1?Q?ECgrzCefxfKbpM8P8Nnf2On5oD4459Dh1/KDVZiDApwpLSi4QT3jxGA+lP?=
 =?iso-8859-1?Q?fyca7C/aWvW+VtLIa2M5Tbq1ii+Zu1kbERkv7UHGRMLGPow48FJ0s/vdfe?=
 =?iso-8859-1?Q?zX1Bb2u3S/+SDiOh3zzGnEJ9+8hbyT7s6BsV1CS4Rnafurr8tisj8oGrzy?=
 =?iso-8859-1?Q?+znrsNKVqK4FRN9JL5giQ1Cv1LSa4ePcIcBbCaDUqiJrPhwsxolHrft4US?=
 =?iso-8859-1?Q?G7kqDYkd+fhgHr3WttpmLbwTDye2xMvPNKPrkV557X19//tJMRTLjK8YVv?=
 =?iso-8859-1?Q?93pOJsebxbATPWfUZSFem1+1shRgFAGmdYqsOqO0sr/LieFIaC7Mpj0Qa6?=
 =?iso-8859-1?Q?+570qQ8ml+RjeGoNSiJJqqmSDfYfvBikXWNyOLr119uLTWn35WHZDv/Wll?=
 =?iso-8859-1?Q?JtH2sey4tIP/pNaAmSsAuE79aeZG8/QDT/Rkshb4pOh8UpCnNg4LeaoQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	B18ixXnBOHfSTGWbf+uIulemBvnCg0A3c4oEls8twU8KNwKu8ngKjFggr/XVktGz4QVrbQpkqj2qivAQEzTySp+fokU+iXgnUz0GzDuwORLTcDtIKSa5TvdMTkYDN/WdAJDXBiTNRSCaK9AATBZiDAHPzoCVIXAdi47FJo+mF6ScfBhj276fEvBS5KELucULnTZUyAZVhXXYwrslo0q90llA7DGsm4zFYOvDFSeg1/ovt0uFw9pqJxUsCZu1uom4Jgrq3FZ7FphBU20bR08Vtk7ZbBCnoHYA011fi711nqST2luF7JR99wLUYm6XfbVzq8f5BgnOLkgXkbg+nZDEQE9Q3DYlex30gnynF9lzICGo1u3tRzSUPuHxtLYUB5QzxTM/mkIUK1Yv8FqjwsrboCMXseGf7c5+qJYpmJRr6OpxlR00zoVyIgyk4G4pAsEkYmlBGstrXyY7qZHvlsfLUvW2EfxYqz6GsPq1x+sTwfgnDsjXw8bzlIqT19FNif8/YXkWig7+Z+f0fAV0JrktiaoHbREt2CtnWY1ssUlpNyKZYJBMyRfjd8/9t6JpUmeSAk+oJpg0pCIdT+pL+pume5F0/ixBOM6m7mVtCyc/nWg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b8838bc-01e3-4d4c-2058-08dd30da0e7b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 18:18:46.2014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YZlavfzs1du+5yR6wLuxNDvzIG5r0Xhyzfk5MkjOweNMFGxOuADIysI3LD1g86O10WwK7DOe7r6EDXIOLhsttXI30unoNUkZ7nJcAnYjnKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5879
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-09_08,2025-01-09_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501090145
X-Proofpoint-ORIG-GUID: JbHQcJdxbEh7gco2egk4ZxsmzvXLM-R5
X-Proofpoint-GUID: JbHQcJdxbEh7gco2egk4ZxsmzvXLM-R5

On Wed, Jan 08, 2025 at 11:34:36AM +0000, Nick Alcock wrote:
> On 8 Jan 2025, Eugene Loh uttered the following:
> 
> > You already have a R-b, it seems the code is right (woo hoo! cool), and we're trying to get a release out the door.  But here are my
> > "late to the party" comments.  Feel free to ignore.
> 
> Ditto :)
> 
> > The names v1 and v2 strike me as funny;  they just make up new numbers.  Not a big deal, but ideally the names might more closely
> > reflect the actual version changes we're tracking.
> 
> Agreed.

See my rationale in my reply to Eugene.

> > Breaking the function out into a new "v1" version is some unneeded copy-and-paste code bloat, I think.  The function is kind of
> > large and the only difference between v1 and v2 is I guess in the two, relatively short, "start" sections.  So, keeping this stuff
> > as one function -- with extra logic in the two "start" sections -- might be more compact and clearer than having two rather similar
> > functions.
> 
> Agreed, but more generally it seems we are growing increasingly many
> fairly similar fake bio functions in the io provider: with this I think
> we're up to three. Maybe it's time to refactor some of this into some
> sort of shared fake bio machinery? Certainly if we grow more I think we
> should (and given the number of network filesystems, that seems quite
> likely to happen).

The trouble is that they are also sufficiently different, and with how we need
to generate code to trace down pointer chains etc in various ways, consolidated
code can get more convoluted and hard to read.  It will remain a balance
between sharing code with possible lack of clarity and more complexity, or
code duplication with more clarity and reduces complexity.  Sometimes it gets
hard to judge which is better, but this certainly can be looked at and we can
go from there.

> > On 1/7/25 17:44, Kris Van Hees wrote:
> >> Kernels prior to 5.6.0 pass 3 arguments (derived from the NFS hdr)
> >> to the nfs_initiate_read raw tracepoint, whereas kernels as of 5.6.0
> >> pass just the NFS hdr.
> >
> > Is the same true of write?  If so, then maybe say so and point out that what we're really doing is changing the handling of nfs
> > "start" while leaving nfs "done" alone...  that would correspond more closely to what is happening in the code, which talks of start
> > and done.
> 
> Good thinkiing. That would be commit
> 5bb2a7cb9fe58d2b1efedd6058d442c7871c45ec ("NFS: Clean up generic
> writeback tracepoints"), also by Trond, also first landing in 5.6-rc1.
> Same sort of thing.
