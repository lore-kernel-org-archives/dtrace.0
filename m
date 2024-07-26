Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE3642AAA
	for <dtrace@lists.linux.dev>; Fri, 26 Jul 2024 22:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722034763; cv=fail; b=fmCepR979XkcOeiEM/5cbqjHtxn6rkBDBvVWvdnkL9WsmC9ScRpi10pCO2gUhKhPXP3ll5rY2T7DNpYAuqwylgLbipZR1TfAM2Trej4yqPgZHoPD5n6iI1JF+N6ZmrGm98WErHOBk4AKxwATUs1zyMUhbjxDZccAB5spA/2HtAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722034763; c=relaxed/simple;
	bh=6E+7sQ8aa7omypEUYP4Yjoq5taDzG8NwxZstRyy34NA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mt0ZBd49keKuTnrJIVvG9pitamsFRBJJVqcipTMU96eWkr89EXEVdRAz94KtEx8JmZ9P/YTfoiN+mCRDc70G8THOlXjPbkyk+42C82lEe9RIZVhlX97UNBtIE5xryXSliPecaTn7GsORahBUiAFQb5Bbx3z8LLOcGy4xs5N4Y8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=oMflbFHh; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=p/Rns35C reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="oMflbFHh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="p/Rns35C"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46QLqgrW031501
	for <dtrace@lists.linux.dev>; Fri, 26 Jul 2024 22:59:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:content-transfer-encoding:in-reply-to:mime-version; s=
	corp-2023-11-20; bh=FN31/X1ygU0LUYai1G+r71PdPbwqrfayv7j6lO+BiQI=; b=
	oMflbFHh71Y5Muk3DNJCCvVj0CSAtlr3zlV+dQ3rJCmse2xTiyhzknGH4w7o9OwG
	onK+pc7TXN3K7rj7boiC6PQFfpteQIaoGxw8rLFUqx/yJzflvsNPSYgt+1+wWibb
	hiq3NwMHqkQIXcAlpudK0mGmNKI7+s5Vo1gvkzKuWIbBtr0zYbPYs/JAR24YEWtr
	ieP4U5ORRKBWGQazTt1KGWGN/98+D8+F8AapxHjGbyy643ayDcBNr1Ojxd2R20Qv
	+8sHY6gnkOfQvql6TPJu3cxj+Vlml20QfvtURtGwSpa/wfNSfsGKvKdn5L+fdPDd
	gRIhVPNZUOfw1Hk6JkJJ7Q==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40mm3hr1s7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Jul 2024 22:59:19 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46QLa5sH000877
	for <dtrace@lists.linux.dev>; Fri, 26 Jul 2024 22:59:19 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2040.outbound.protection.outlook.com [104.47.73.40])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40h26e4jp6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Jul 2024 22:59:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q00kGInmsdBLpOrTPMCHJpEv4h8+4sm0ST9cSyFHZFQtCU0V9JNuCFlN7+QBpZFgXzMWh1m1DSf5Sb+wtOM7be1LF1yfyX1WeHBaSMwtOZjsSttcsp6DotlantsE8CFJ6SFnvyPQDyETlJnDVduNv4eYzVHjaDCInQfjOMfQk3zsmmwzn2EplOO4mfn6bvD9Z+ahVQdhTk8olj/m04s+t1JZcWuu48yCCQ3AY9YJf7lTG1SkFW7DH9vNd442zzw8fXPfJF8DUf0+NCwnBFxiAou9EeyWeHCICRCVA+EpM9vb8hw428Qd7QvOskPyc3UgwfYdaHYtZ9cXRxqOLKSaMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VHhzRBAHMr5cVCgYBAMASzfYQ3uvAHAuPS+Zr+hw/5s=;
 b=kWdSeI3bOPbWjd45VuazyRxYsP9j999kXTLFoYiJc+IP/6/LLawifYCuket4J9k/9m2If52vcja3jA2HqpmtrSqITG0fIDInUUyrmsvdr7cF8gFlCUjHXKhTMF71ipUAU8tZZTr932dSjhGjdtP+ZLkwgcrLVEbNHV9YtMUjsJLyCeh273ncsjci9mGrP0HaDXRWOmvTJ0Owts2E+6Oln+7vDgRVS90FYbFMutHweWocCI3vQC5AMPEu6zVL3CNjd5tfLFgMhfsPxX36AmzdvNpFNiDC+gkHBpAqwKEdlyC2yDQwHLNF8m4PThdfJBQJZRyNiPeCcCVfbvgdhYKgjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VHhzRBAHMr5cVCgYBAMASzfYQ3uvAHAuPS+Zr+hw/5s=;
 b=p/Rns35CuLv23q8JQrB9LH1EKb7R3IhsAD5Ad9WQ2pPIrBFRD58np7QR8qEoR77q9mtwEyvGec3p45FUgyI4H8cwZP9NQRZ4plY/crdEe/D2t0erMLNCEtHxmcMcC65E2n4/hyxptfh3QX9T4RvlUCOH/DEmSA6JhaHmAfrewvQ=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by SA6PR10MB8205.namprd10.prod.outlook.com (2603:10b6:806:43e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18; Fri, 26 Jul
 2024 22:59:16 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7784.020; Fri, 26 Jul 2024
 22:59:16 +0000
Date: Fri, 26 Jul 2024 18:59:14 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>, Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace-devel@oss.oracle.com, dtrace@lists.linux.dev
Subject: Re: [DTrace-devel] [PATCH v2 2/2] tests, actions: fix tst.symmod.sh
Message-ID: <ZqQqQnrUsB//0mNx@oracle.com>
References: <20240131141306.355929-1-nick.alcock@oracle.com>
 <20240212162131.136636-1-nick.alcock@oracle.com>
 <20240212162131.136636-2-nick.alcock@oracle.com>
 <c1d9bd72-5e76-ec2e-61e0-ed9a68b07850@oracle.com>
 <871q9gl5da.fsf@esperi.org.uk>
 <ZdTWzXYTTvKBfKiC@kvh-deb-bpf.us.oracle.com>
 <842b8662-978b-fdaa-986b-59b350b56ba2@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <842b8662-978b-fdaa-986b-59b350b56ba2@oracle.com>
X-ClientProxiedBy: BL1PR13CA0326.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::31) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|SA6PR10MB8205:EE_
X-MS-Office365-Filtering-Correlation-Id: a84dbf34-cf04-4939-43bd-08dcadc69352
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?aCYT9Y+G+RktsmSSkANXA/oqDNheyWrQnRyWve/fT5Ydit93zUJSoHVvKL?=
 =?iso-8859-1?Q?EWKuS5XRARfomkGaopMl81vRY5cJLYwM0VNYqhKzgFzy7Ah7j6DkYBX5d1?=
 =?iso-8859-1?Q?cz8QjjG7Va0lrpZBRxYXb4VOadZWvMes+6yv9kFGt1g159vPb0NP7WbqVU?=
 =?iso-8859-1?Q?R9/7SMmk9K99pDBjaPfsymNqjkOoTPLhrGUu16umKaeHGlfraN8RyogEpZ?=
 =?iso-8859-1?Q?XVzL9Ut9pOmU0HGufsgWHoAbb1hzP0WpNRa+/scwxN05bE2nKd22y211lO?=
 =?iso-8859-1?Q?joj9KtD7ucH/CAquf/RQBUMlLv2fE82KImxyk1yZhk/o+kyfDohhlXkpL5?=
 =?iso-8859-1?Q?oHmDo0X1JdeHoJhm9UIhJxSCnwgoybW6QKmk1jeXbRm0oieGDyYtEkfi/J?=
 =?iso-8859-1?Q?XHoz5bEKO9QNlzQP7H2yiWxadIItS0DJyJGq2DYQT42xFjYvR1vau5g+Tr?=
 =?iso-8859-1?Q?BSlfu+bDSJxxapS/O4FtFK1OYqCVX1cjeZcLknI6JicOPJ6Y/e/fVTpsPd?=
 =?iso-8859-1?Q?QcmJBegq8PnaVK3XWEzP59AlnflCUKA3aw7I6zICHBLgWlW8bJ+7oGYKSw?=
 =?iso-8859-1?Q?zcHYC5TxW3WFK+QaWH5SJ7Ec1zqrNPzYCJTN7nrxe4/Z4D5tl3104iVFdV?=
 =?iso-8859-1?Q?5+NAuYpgeyo73pci+HtEAZMGOXnQKuGrOx3kRkoY1CfadFJ7C79aVmVxGI?=
 =?iso-8859-1?Q?p04HZNjrVwaPcu2JJIWCvynbxsWD+ybYRl0XbHIqsCaxav9JBd0E54oW2N?=
 =?iso-8859-1?Q?tm4WLDN/gucqzkYDzYvPgKLmiM/4Tme3k1W00Byl9d22neqCtAofQhO6Uk?=
 =?iso-8859-1?Q?cXakx6iLl1TjhwD6sXsbmhncCFGHEuNnZy3KdKNUwufMOxdzlR9XVETK0n?=
 =?iso-8859-1?Q?4k1akq3JJdNzxLQU3zthpc7yGUZ3lz8nXY4zcr+8/m/bJXb5yu0bDS1NwU?=
 =?iso-8859-1?Q?F9zsyObLASC0cNahEZYB/trfXC979iTwhDcJ1dG++W6xjnVPAgKKqiNCw7?=
 =?iso-8859-1?Q?w2dc04gLCQ596NakDqZ9e9m7tlv9MW1LT9AJJM3tWWDtz5IHSXaTLPL3Hq?=
 =?iso-8859-1?Q?Gzap/QgOevvL2C9dvPAWvB5Kh3qNCvlZpSjlAC+TYShWG/p9VgA0UrQ/lD?=
 =?iso-8859-1?Q?zkquKj+5CycHSvkwxBuN+RcE0ukXJf6yKGduxmcn6fYEMAMCvCGpEH2wcA?=
 =?iso-8859-1?Q?njr62iuuLbqpLwPzodP4oXPkqY5ATBa4/vlu0VX054+ENR1FspqA7qUiCC?=
 =?iso-8859-1?Q?tHwGMXdhxyxCSMd9IGCMUDAhUFh5zXRcl9BGihpfUa6eu3IAuj6A4elwAu?=
 =?iso-8859-1?Q?0tlFb4LQ25D+WwS76673f5hHVYfh4wukrq5X2DnH6nxHMUQ6IaY0hZZoG3?=
 =?iso-8859-1?Q?MGnfuoP0+Q9H3LFHlxPZsZcw9fwkcIR6Sc/P6/bm7Ahp7u1avw2TU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?WV9GQ+D2/E/294CYAWKug063/hNbcXMdYrTbkLx+jEKKK7q6tsa4eFuiQg?=
 =?iso-8859-1?Q?Ge8+NEPeH/bRXq1CJFP+YpoND9TL17UJEVS10jyhC2N7eP5lSdZaGdPrBz?=
 =?iso-8859-1?Q?eDrhP001UJFEzvVWrYV8gWpJzVqsEok81OJoxzik/zIEFG3AwT0sD3UA10?=
 =?iso-8859-1?Q?d6tILSKcQ3MGkj08Ret3c5XgVbFFjGOdElru/MjKRBHsDa1+acx69B2Ll1?=
 =?iso-8859-1?Q?SPCftTR6ZpZUvtynP0flODVZ4hfeNJlUN6j6eV+Fdr6ahCCULoku3KBcEt?=
 =?iso-8859-1?Q?exSzqfkPGh1NZSUQHIExPNrIbYB4gnjehj0GJh35w0vGcZek+yY/5FYeWB?=
 =?iso-8859-1?Q?s02TMV34EQYTJPXHlA2tbrdGCdWo08oGvdWLjaJveMki1s03sxC25z/Woi?=
 =?iso-8859-1?Q?GiYyo4/0ibRiZGxSKNX3MPdenqANIeVzmklf5rVv+TlJdmg09YxrbwuPcd?=
 =?iso-8859-1?Q?+I6GkycioDRFlwgpIF6GYyLoZ3I3iVCr4igyfh4WWI48+1UmmHVNQ2aM7E?=
 =?iso-8859-1?Q?TU89fvXf+Lp3IRgEKAyuPJkvw4qL3JxNsK4th6Ps6Z7n7L+MJGX61MqDFZ?=
 =?iso-8859-1?Q?v+d7yghB1oSk8QxGKKpzn4TljGdgGztyFAJvrARGewhJ3I7LSzko/kCGqj?=
 =?iso-8859-1?Q?Ley+InjpLnJRMHtH8m4LXP6wNGagqDpk3BBLSYO5uNH77+HzZib7GGRvYZ?=
 =?iso-8859-1?Q?ALUKXQeXy4AwTZPzHTTVAf8sANUPrTMWyQB6JwWLRCE9A9NK64kGEAHKgL?=
 =?iso-8859-1?Q?XR/2T1O+MgtJewDtfOxMX+suxmUzBEQfyNRJ0L+w+udML4kKjc9IXw/6PS?=
 =?iso-8859-1?Q?qn2WGzzlK5lloiIKtsBrkJHe5qqh7H3EGWonaRylVtppANyS4eObLGrVzb?=
 =?iso-8859-1?Q?KfS+Yw5RpioX3UB8lVCJNiogKyyn5LwNDJshUylB3na7Ng4g2fIkx3Wrml?=
 =?iso-8859-1?Q?9ww+EsvhhDFV6rkM1EVn5hg5OK7cXzakFmvBwp1usb9sgAaKVFmeq0Df2X?=
 =?iso-8859-1?Q?aqtv3u2mJCrApvZmvX2bS/4yWuWyf2ihiCslxviM6s84njnG9DIYkW0P3m?=
 =?iso-8859-1?Q?zA5ceCTHx0cv8PfeZCwTldH/TH6ZW8KVwa9uSFGyG6PNEWxH43RHM7aw9J?=
 =?iso-8859-1?Q?xDlvCCTFYTNmEngdBngCBOLr64CugoPMnoCoOBCO3k0tAozSL9s+XAtE6H?=
 =?iso-8859-1?Q?hrPhbO3h82h6TjFVJE4AEE4TPfC+ZE+rHOGYsRo+vMUt+Qm8N+1u7ZCFAc?=
 =?iso-8859-1?Q?6ltDX+NydRu7JETIhguUU116VhnXVTi5pDAP8KEG9MoKmbqAHt+CkyNBvI?=
 =?iso-8859-1?Q?1BVm4AYNHsGUt/67Y9+IIoOHGYFeZASz/dOWKsyBza2krVq2DWTttJl65B?=
 =?iso-8859-1?Q?oiytJnuQoYrU4gupT0KgrIouS8jz4cXxBO6avBgPjKyICsEyAcmYAVroZ6?=
 =?iso-8859-1?Q?+jdjdT2HG6gJJY9nUV7OvQIs1WnYNnA4tmI8gWtdXQpX5JzeKFBJ2kI/1C?=
 =?iso-8859-1?Q?DxXY0jrN7b+w5AxVG3fKLOajEvF16eRxF41RMEYQHmDLpgIY8DHlK2EzF1?=
 =?iso-8859-1?Q?bsNWOt63W/OsEwNBMWJOCj4dDUcgc9IrY6NmWkCHJ65OaRG6obQTvktyIa?=
 =?iso-8859-1?Q?amhSkr8iltrJNM9XmJy8LCwiFLzr3aTV7ggfnP/Bu690gcGiUyd/1jfQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EGmDuXvTh6SrSKt1saif6PAKYcZj276P76RC2xJ4A9clpxAbK1HKs0lEjgVARBvKG2owXx2Hrbp6hC4+u5daWmA96+dpsz+CgXXsHXZOCF6wNRrUPsYdBzHuz8XdyMlL2r/ED138BHkiTsNvRJW4FZs4IDLE0wDvvSUvgURxreMu7fU499SDBe+lnEUQjw/NHXj3GwrYzRhMbAqdX/ytD/PMycOv/PnSpjVU/IhWkoKz9M6mGzlUPl2Ec2TiwwcgStK0b42Rcsc1GqOTZZUO8DPY2fks+Lly09OCXTPFdr7B137ocB5Wz3UiWslwfzzew8AWASx/zWYSdYqHJWC8lunw21/rMc/n/Teiiz15QuDoD4YRS3CBdeR/N8mFWuWUr1p9TxM9EYZc3U+BJvuAsZr+kATQCVda6VnJSE+WXIlstk2GsfdYoyCUE/r0CTCB+1ItCx9tK3g0/k6ni2JUxPelHtCBhoTs9AwnH/7scRd8grCzLGgFLEzJageRfahaGnc613ffFjM7gt2Mts2l5undYu6tdNW2ikqIhfOAM8ONwE+kUtVmx+N2SM0ojA2eHy1pXda+WxBW7J8FqIWJbjPb38WUqWkgnnKhQfcUlFA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a84dbf34-cf04-4939-43bd-08dcadc69352
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 22:59:16.7351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /TlQAiUDpYqWksByh5DWh5pzk7BvZFvY0gPvC+RjHO+eX/M3LB7liUjvG60GdhaF5PZ/zvMQc2YHVCm6N4lf5Bfxp6mkm6VgCUr9/lkss6E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8205
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-26_13,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407260155
X-Proofpoint-GUID: nVpIrqLirITdhZF8Em-BSuyx6boCU0fI
X-Proofpoint-ORIG-GUID: nVpIrqLirITdhZF8Em-BSuyx6boCU0fI

I am renewing my question from Feb 20...  It seems that a v3 of this patch is
needed to address issues as discussed in the exchange below.  For now, I am
deferring this patch pending such a v3.

On Tue, Feb 20, 2024 at 02:31:42PM -0500, Eugene Loh via DTrace-devel wrote:
> One question is what need there is for this test.  I think the "need" was to
> wean the test suite off of /proc/kallmodsyms.  It's unclear to me what
> urgency we feel on that.
> 
> Generalizing to any symbol opens up various cans of worms.  E.g., DTrace
> won't handle every kall[mod]syms symbol, and the test needs to be tweaked to
> strip [] off mod names.
> 
> Maybe for now, there is a simple solution.  I think the test name and
> location make it clear that it's doing a sanity ("unit") test on the sym()
> and mod() actions.  Nick points out that mod() is not robustly tested if we
> only pick one symbol that we know is in vmlinux.  But still, maybe a "good
> enough" solution for now is something like:
> 
> - # pick a test symbol from /proc/kallmodsyms
> + # pick a test symbol from /proc/kallsyms
> - read ADD NAM MOD <<< `awk '/ksys_write/ {print $1, $4, $5}'
> /proc/kallmodsyms`
> + read ADD NAM <<< `awk '/ksys_write/ {print $1, $3}' /proc/kallsyms`
> - # a blank module means the module is vmlinux
> + # the module is vmlinux
>  - if [ x$MOD == x ]; then
> -     MOD=vmlinux
> - fi
> + MOD=vmlinux
> 
> On 2/20/24 11:43, Kris Van Hees via DTrace-devel wrote:
> > We still need a v3 posted, I think?
> > 
> > On Tue, Feb 13, 2024 at 04:02:25PM +0000, Nick Alcock wrote:
> > > On 13 Feb 2024, Eugene Loh via DTrace-devel told this:
> > > 
> > > > The comment about never using shuf does not belong in the commit message.
> > > > 
> > > > The indentation in the file is with tabs, so that style should be preserved.
> > > ... it was? Whoops :)
> > > 
> > > > Instead of inflooping (in flooping?), how about "infinitely looping".? (I do find some occurrences of "inflooping" on the internet,
> > > > but might as well be less slangy?)
> > > I find 'infinitely looping' clunky. "Looping infinitely" is even
> > > clunkier. Inflooping is an established term of art, frankly.
> > > (Irrelevant given the below anyway.)
> > > 
> > > > Anyhow, instead of the shuffle approach, how about "awk 'NF == 4' /proc/kallsyms" to a temp file and use that?
> > > Oh yeah that would work, though I don't see what's wrong with using
> > > shuf...
> > > 
> > > > But even that won't be enough.? Once you allow "any" symbol from
> > > > /proc/kallsyms, you risk encountering symbols that DTrace doesn't know
> > > > about.? Stuff like __ksymtab* and __kstrtab* and others.? I think we
> > > > filter that stuff out in dt_modsym_addsym().? The same filtering is
> > > > done in test/unittest/consumer/tst.symbols.c.? It's the headache one
> > > > saves by going after a specific symbol like ksys_write.
> > > ... but doing *that* seems like it would render the test nearly useless.
> > > 
> > > the fact that tst.symmod.sh as I found it was broken for *all modules*
> > > even though much of its code was meant to handle them suggests that
> > > whatever it was intended to test, it wasn't actually testing it. (There
> > > are no comments describing what it's for, which makes it hard to figure
> > > out how to preserve that property when changing it.)
> > > 
> > > (I mean among other things it was carefully selecting a guaranteed
> > > non-modular symbol, so what all this code to figure out what module it
> > > was in was for, even if it had worked, I have no idea...)
> > > 
> > _______________________________________________
> > DTrace-devel mailing list
> > DTrace-devel@oss.oracle.com
> > https://oss.oracle.com/mailman/listinfo/dtrace-devel
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
