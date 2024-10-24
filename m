Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28281ADFFB
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 21:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729804367; cv=fail; b=RYcWLTNTExGttXJMIFW6Y1kU9rmLXSlsZ3JdAirrxZNaVdy/Q4chpJ201G6YWo/p7txbkkfvfa2t4ctTafGvf2AB6GLpCGFmWH6dbgnDBmerSMQcCSJeIYjA03u9VsVLwd3WPolgOQJ2aw7AzENqYnudbvz9KEOPhBjeBGMWErU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729804367; c=relaxed/simple;
	bh=pC2lYucau47kAklUP7OqKRzvbynn0dAUrw4ned+NEZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=is66+SSAjNe4m+GUVhMIJSJkhnSR5HpPVpD4KTpJswLME64kC2lh2fVmN4vQFcwXeWUwhyY6h64xyUg20Ew23zwZpjCx5tmtQYl2KM5mePl9bcaq4wWIl3BJyGHL7HfKMiQCF0DhbJjuASS/WCyW/SEuhFb5LpMoloDtd0RGnuw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Q4Ks9nR1; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Iqme1Pct reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Q4Ks9nR1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Iqme1Pct"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49OHmfQT006245
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 21:12:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=wGI7lDWWk/eIKsOGmQ5ooMVWn2lhEp4OrhpGXEZN1qo=; b=
	Q4Ks9nR1IUmQ2V/euj3Dr67OoAFZRodTHlc7M9xbiRvqym3tB2BL8U07HzD1m52w
	vQoyItgr4bJ5+NvkuY03LxAC53Gi5ZK2WmBQsQKdad7kwVGOFuOXnZtZnmLJ0RMr
	BdF7MrHhqD97wz8D1EToNfEtI2wZCDC6ldTd6YGDKcNnYyiYzQc62LOUd4GQZgUW
	mJLDr/ye4ehkLgXXHja8WIUL1b3WGzg2A1FVzP10aP1SJEn5syvRHjXHNHiMPgQF
	f9wfWrZr8ts9yS9TC7zRrlGq9f0T1brvTvBPBkk+AbRdaZREpBTuRekEVQ13fDdP
	pfx2Mw0r/WLbXMgKcM5x2w==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c55v3pv1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 21:12:37 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49OKUq4a025313
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 21:12:36 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2045.outbound.protection.outlook.com [104.47.58.45])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42emhbh2k3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 21:12:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iilomd7AoIXdIr1RIjHBd4qaQRzL0Sg5ozF5F7n94hFykXxctjQwOCVIMen2WQFF9JB1II68uUKF9pRlXOm2Ew7sriKBu949ZTL6ak9ddKlWwyGh3ZosmUKCR3Gri77sHdfVa7kY4N0RL96ZjNNcaxhBAAHgPbDJm9Dn8mN6lybE2Kiug1Evv+K9Wp85UpOZfWSYOazqA9DKqvA59pf0uzhUm9JCxvGSxGkn8JXffbltgKqLXr2P+dHqrZXvjr/jjZSgwxAPkyPo4Uu7waurxIQTWPnayQeeMsZo4DXpVqmVags8NqlxWT08K5OL0li2XwqLeV4qMk9lESMA3WUnag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Crtlj0lJxoB3M2Ad9pfnfZeO3g5RkCMrZHrABujLpRs=;
 b=d/st1J5CHJdmxofaSr5Ff6NikPCFHmBIUYi/bRhW+y/DmDEVn32Ivx5AzJGjfUGRRudcXkpSXwzZFAutUHH7sOfoHwyv1CoYodXscKFNaQjX+pgejBbzrbrEO2WXiE6xSGFIMaaJ1dxsscQQxR/ZbjaTdWCZGboTumEQV0ffl8gGv8BG/hPXfe1OJRP/SmdRJgzK8JdCQs9zckPMgXb4EfdGL2BEU0FoLi4JCzKtkxcxVq+tvWrfNEFGBWxxSvihPvkRJVKRnQvKwS2U/5Sj6mB7aeEtLrenQ8pPO1OdxPjuuiNYuuJipHSi7gz7y1nXSv1JXmTAMW5h7f3ui/szYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Crtlj0lJxoB3M2Ad9pfnfZeO3g5RkCMrZHrABujLpRs=;
 b=Iqme1PctigNBqMPVTOmNqziievO4BzQymEkVRISlZQZ4QExP1BN1uLu76Cbp7nPQdTPSnNDh2bk6ahujL6eSuRVnvHvwLzs3OhP4Gs5Ii4gtLNZmxlQNIlY47JyWf1jRjhFULgygFUPGWvog2nZhBS+k8Mee2QmihA1QzHfZMbs=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by IA1PR10MB6145.namprd10.prod.outlook.com (2603:10b6:208:3ab::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Thu, 24 Oct
 2024 21:12:33 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 21:12:33 +0000
Date: Thu, 24 Oct 2024 17:12:30 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v2 15/19] Ignore clauses: some clauses are
 impossible regardless of uprp
Message-ID: <Zxq4Pk7yKVnbWxpR@oracle.com>
References: <20240924202554.7011-1-eugene.loh@oracle.com>
 <20240924202554.7011-7-eugene.loh@oracle.com>
 <Zxlcbjd4QSoU8H+T@oracle.com>
 <0ac389c5-769f-b86d-ae9f-c9102e774c2f@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0ac389c5-769f-b86d-ae9f-c9102e774c2f@oracle.com>
X-ClientProxiedBy: BL1PR13CA0093.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::8) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|IA1PR10MB6145:EE_
X-MS-Office365-Filtering-Correlation-Id: d987c876-c3f2-476c-1f9e-08dcf47093fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?BxWXLqFaGNDw9nhh5F549xQTWAfQG/qP2vGWq7Fuk+IWRRckIZhTr8lFEg?=
 =?iso-8859-1?Q?UkcXL43o2UgsIKGVyo08jMYx48wa0jnbCTAh5dFPKbbGO373VXXQK4vkQ+?=
 =?iso-8859-1?Q?p3oi3m8vTXqM8jpie9+9lmX21as55H/pZCwrh+0J1TmofJxA6r4q48nOUL?=
 =?iso-8859-1?Q?V+uhUjIVhh6hTLAk2JPMWFCZiO5fyNjAAW8QxURFSpFXIaEvydcrQICovY?=
 =?iso-8859-1?Q?P//3s6kGykx6x2JfNjaSaiR3lpniz7YJQjFF4MyK8y4BJMll9Ry0I2axD8?=
 =?iso-8859-1?Q?zfLKeNfpRNQ65kY7POFNABHE4QPZV58njUh/zC1iV5gxo8YnJHTf3scvUy?=
 =?iso-8859-1?Q?venNM74Hv5zA/P0Nep5R1Tl0N8Dru8qJVqnLV5EIz2q3yKAXRM40wkQxgi?=
 =?iso-8859-1?Q?wqT7PHuZaOrd1rfIwxAiirfHNsjLjW1Q4TTsJ/ReoHrb4mEN0lDiLdJgZL?=
 =?iso-8859-1?Q?aukdxSlT+0oPYIaEhbjmSmiK3BlZ/FIzqj8CBt8RZ/4YI2Di7ITsVY3yht?=
 =?iso-8859-1?Q?DIhlrOEP/5Kq4qP6/jQw2mHy6eLOeT/YywzCoH/Dhnl1qMFSpG9KBqeSVK?=
 =?iso-8859-1?Q?PxrKluuEtF6cw+tyuAgRDI7y4vPpk68+qCp70qlhS/zXN8rfVEV0lX/pNk?=
 =?iso-8859-1?Q?UY68uHD9KmDvPVGlBoxU6KZKPcy1E/zNeqU7D1xS6SEEIXwbk+fzyUZWnB?=
 =?iso-8859-1?Q?OAtF7N/CLFVI9OOx8LNJcSniwbCaqTALZwMO04Pw7rCwPDg74jL50HkU5n?=
 =?iso-8859-1?Q?v9zTR0Ck7tcIlaqcUhCbYzZZt2OVdn69xJWD38OlPjySCAW6W37hmq+HRE?=
 =?iso-8859-1?Q?xkcBLPkbh1MvXsAnIJOfGf2QKpvLFPzOGwaRCAWl4SiqhTccW7wBVG5YA3?=
 =?iso-8859-1?Q?dcBrzoUS0dB7t+EA9K1EinV2u2pKqz6Y+DoGOLgYxVE11mzZyqUchRzHAj?=
 =?iso-8859-1?Q?jClctXZLZcmarrRl1mYA6xJOH/q0jl97R4bRh+E5vm+YeGGrdOENou9hbW?=
 =?iso-8859-1?Q?ii8jBYXAdHsudAbpGZ5Jf+i9UdgyZkXVA6sWMLEQ7rXuAY+0sIu/T+fmgO?=
 =?iso-8859-1?Q?RVHWhLM6sI1R+iAIjhrpQGeOoUeZmogllZ7C3GTDXx31PXZ/vK+NBmAiQ3?=
 =?iso-8859-1?Q?oABi9mNq2byKXyOFttYKl0gBHDAMMtPsa9nMPD0gHeiHOHm8IrxoDSEE+y?=
 =?iso-8859-1?Q?ZpGFofSxabsRJRYlJOO8ApyBZVbbqIjy/qM/k4v844BHCuscYW+vpzOt4Y?=
 =?iso-8859-1?Q?AqUtNHN5cT+60/Lq0OocG2rSbALWPr2EytEm4LznHinXeZI9b0lwABtiuz?=
 =?iso-8859-1?Q?oPIhzn+O/ghJgxzFKXQlUG24Bi2kKRg8+BWd/w6Enrv5CfjgkQfSwxIWZP?=
 =?iso-8859-1?Q?5S3YI2ClMg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?IzjXrA0FpXUMdhDQlWgNXq5q/c6H0RNOB5ud89k4K4OiU+N0uWx8aWbe11?=
 =?iso-8859-1?Q?qdaKWCs+F/pViEunkliWQDzzf09phfQO9blNSclh1Wb5vx1SWqeZs8bD6w?=
 =?iso-8859-1?Q?WnPDQJBBJBuyol4KF6ifxtYAg7u/hMF5h0gvskYFr9Wy2An3A8lhTg7q21?=
 =?iso-8859-1?Q?WorfgVo7S1AEwzaCOTH1V7H4d52lctTdxwKE7+e6KzujpR0dUpwVfMNjme?=
 =?iso-8859-1?Q?fL55DM1szDrOpkPNox/4C+JvggdB4oXuGg6Mq6Q4p+1jap9w8jPl3KOyEw?=
 =?iso-8859-1?Q?KNjHQRBkeK1PfILLoo4mE8LK9xwXKsUTvx4A3f+M/cCglA4/iOd2QCJ+h0?=
 =?iso-8859-1?Q?PqHR5mx+pYj56KN73ZO+8qH46va6zzhaIDNc9VtxVMr0sKDaG9mgaJmA87?=
 =?iso-8859-1?Q?LQw2yxaJeiSGvN5fB44+L0jSXMpcyVj+MhQUXiau2UF5Q7GWJrHKhRq1n7?=
 =?iso-8859-1?Q?dH1GC2rzpkx7boonMSu50f2hf7vW7nPKsLGN5GyRE4CUD5HkHlbO6jHKu8?=
 =?iso-8859-1?Q?m7IUJthgg8jP8VPPyTnKSkh3FhaciFQY3qlYzbS3RvuWBjIug7cRtWntEE?=
 =?iso-8859-1?Q?Z2KtcSotaJDyIht70X+d58W+X47orRsqA8PLYdX8wU//BTa4Gwk3ibukoA?=
 =?iso-8859-1?Q?TAV9FWC7x9GjVRZVrtgQPia1h0f9aIbVQo6iiwVnytVnz9DdfEcZBxVjqV?=
 =?iso-8859-1?Q?mYGSsTTiAskNCzopvXlqL92O4YPIxiZhB6G0tPE324utQCMxI1Y4vpuovB?=
 =?iso-8859-1?Q?GYwvD9uTz8SZJPizcbusxQXlSCCV/HEfPURy7X2EkkQvEag8Ple1T1IJRG?=
 =?iso-8859-1?Q?k9O1ywhwOoOEUJVZ55GajOZYv9tGZ4+FVnhNP8UNxmo4MqOZXIXwEBNdMZ?=
 =?iso-8859-1?Q?bTJAiyvVRtGwDN3otOnsB0JXvK1YLZJZNMQc4G8pxn5oehu/xEtYPqyvIf?=
 =?iso-8859-1?Q?uqSTkht165AkufjEBe4Sae+gZqk2ChInggJ0j9YzDiPc/lv0EyOVcu+05Q?=
 =?iso-8859-1?Q?esDyR/kCYL7oBGOSLUtlkZ/lEVIMJrm6A1kc6GwuoCbkqGhGRO7PXsJz2P?=
 =?iso-8859-1?Q?idtBXm3giYH1nNBo10Cj1g/s0nTyhdt9QbRNS6iM5fX/PQfms0f80DT/Rv?=
 =?iso-8859-1?Q?WcR4rR5zV6JhjxiwHAKgz0cF6uwNBnLld7fpwnSIuQi/bNywveu0hSURRA?=
 =?iso-8859-1?Q?vRIDxMw9ybIT4YvKo+kkshT36UmMC7WpxnatYHS/OkalRS5HzQjtaTtYq8?=
 =?iso-8859-1?Q?2LueBXrnOxKFzwc8Y8ztq3Ocfvx1CgEwIH98NMtYbSrBqmvNJxbs0HwQD5?=
 =?iso-8859-1?Q?d0/vmuj7Hb8IM8agvv7Mb9E8N71h41swtrOYql1wYelzSijhoqGUaNHTgI?=
 =?iso-8859-1?Q?eQmH7fF/dbz6UdMoawVw9+upaP1MkEj6RLyxtZnxrT/oMvseyc2g/vtW1E?=
 =?iso-8859-1?Q?cT6VzTPScsLR++AwerFlBu8ZnPOxdtGhB3YVC/coLo3z1/Eph4bQLGq8LU?=
 =?iso-8859-1?Q?I3t0HpAwCxYLE5gRtWsogC0SBXKvUnkyMfuGTW4WqfP5NauEClHERQklKV?=
 =?iso-8859-1?Q?FSUxC1B2sSA2Eoxpu9SldFpao/66dO+ZJ2JCSqlQ9T47olbQVp9DAWEStU?=
 =?iso-8859-1?Q?sm+JfPutOu8TETBiMEXJ5ZkIBy59LMawgNVLVmOYhEFdevTn6EdQBU9w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ik6cmlEirGhmqVeLqCqHEvM8wXqlZQ8DmUgiZsrisrPsxcx1qBD52Qlq+jNmcp3vMTks9fRxTsOnQVIw2buG3ggdVRD4gT++v3qjYcr15xULU1jsx5BYpa/jGdHr4SrUxZNifYlpreNAE6N1sLePg7bf0htHr+of0Rky6V+qNT5ZBvxbGi0TWO/vCcuOI/kTb/tv7oBuVJ/VClvtlkGHyxvBkRi/MNbfdu5BSovZ4q8Pbm1kIyiBfpXEGFaUzU69bkHUVo2oNySs+tWP58hMmFOLS3YgFouQAEMVdXTAjrgqZLJlHnVGbOKEuC6qvf8jGKIeZck1AyrxY7ShmuqtOSPY8hXVlskOErAiEQTDurVPjYfwfiRKUfUcKk3V9Qt7lPrPArVkVNMeCPiFgkSLC06SoEkNOyuJd9UtMrQQ7xOumMUIfDR1AZH+e80i0Zj+/1iP00WsPndV+XXCc5gGFaWFMah0l0rcotRp0b/0617G2HgARVbRQTpoB58Dma2fs2/c1hPJzWTMNGSmkVKamxDjOQpQh0u6tJT/L5nzwK+/Q8J+vAIiNLX3Nfy2D6biqSpntIk5g0gciW92zQ2ZpNd4OAl7VM/cRicZE53Xi/A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d987c876-c3f2-476c-1f9e-08dcf47093fc
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 21:12:33.7784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5UBUVsyWNYFhnaiQN1jLG7scVOQ8JBiuLznEoQPvwGSSLMdZWqg9tElTqf3DCRcaJyW25zPNLjIqXWTuRYIr8/OgJ31e8Q/tCODPJIq1EU4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6145
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-24_19,2024-10-24_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 adultscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410240172
X-Proofpoint-GUID: bg9hM_mziIZt2Kau_gYPnYK3WfP3CByf
X-Proofpoint-ORIG-GUID: bg9hM_mziIZt2Kau_gYPnYK3WfP3CByf

On Thu, Oct 24, 2024 at 03:30:13PM -0400, Eugene Loh via DTrace-devel wrote:
> 
> On 10/23/24 16:28, Kris Van Hees wrote:
> > On Tue, Sep 24, 2024 at 04:25:54PM -0400, eugene.loh@oracle.com wrote:
> > > From: Eugene Loh <eugene.loh@oracle.com>
> > > 
> > > In ignore_clauses, for an underlying probe uprp, we try to
> > > decide if we can safely ignore clause n.
> > > 
> > > Meanwhile, for some clauses, the probe description tells us the
> > > clause will not be called for any USDT probe, regardless of the
> > > underlying probe.  For example, "syscall::write:" can safely be
> > > ignored, for all uprp.
> > > 
> > > Add a dtsd_usdt variable to each statement to track status:
> > > 
> > >      USDT_FLAG_UNINITIALIZED  not yet initialized
> > > 
> > >      USDT_FLAG_POSSIBLE       clause could possibly be called
> > >                               for some USDT probe
> > > 
> > >      USDT_FLAG_IGNORE         clause can safely be ignored for
> > >                               all USDT probes
> > I think it would be better to use the dtsd_clauseflags member for this.
> > You can add dt_stmt_set_flag() and dt_stmt_test_flag() (or similar names)
> > to set and test for specific bits in the dtsd_clauseflags member using
> > DT_CLSFLAG_* constants.  You should be OK with just 2, one to indicate
> > POSSIBLE and one to indicate IGNORE (neither being set obviously meansnot
> > yet initialized).
> > 
> > I don't really know what symbol names would be best... perhaps for now use
> > DT_CLSFLAG_USDT_INCLUDE and DT_CLSFLAG_USDT_EXCLUDE?
> > 
> > Main thing I would like to accomplish here is simply to access flags on the
> > statements through functions rather than accessing them directly.
> 
> I'd like to push back here.
> 
> First of all, the patch exposes only dtsd_usdt at the dtrace.h level.  That
> variable can hide whatever it is that USDT wants to do with it.  Your
> proposal would expose at least USDT_INCLUDE/EXCLUDE (or POSSIBLE/IGNORE or
> whatever we want to call them) in dtrace.h, and I do not know if future USDT
> would have even more stuff it wants to play with, meaning even more changes
> outside of the provider.

My objection is primarily with adding a member to the statement struct for a
particular provider.  Especially when there is no need for that.  There is a
flags member already that can be used for these purposes.

We never know whether there might be future needs that might require changes
but that is not really a reason to make changes now that are not needed.

> Second, you say the main point is to access flags through functions rather
> than directly, but to date we've been accessing flags directly.  The
> set/test functions would be new.  If we want to stop the direct accesses,
> that would seem to be a different patch.

My point here is that doing this from *providers* is a bit different than
accessing things from the libdtrace core.  Providers have been written to be
more separated from the core of libdtrace, or at least I have been trying to
do so.  This particular use case seems to be a perfect situation where using
accessor functions makes a lot of sense.  Especially because you are changing
data in structures that are at the core of libdtrace - not just usiing it.

Alternatively, I'd propose simply not doing this caching of state concerning
which clauses to ignore, and having clause_ignore() determine it for a given
statement without using cached information (since these flags really amount to
caching of information for optinization purposes).  Perhaps that is the better
option right now?

	Kris
