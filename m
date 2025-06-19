Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E417B22B598
	for <dtrace@lists.linux.dev>; Thu, 19 Jun 2025 13:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750338248; cv=fail; b=tXMea8fdSJmdXMtWEfjGEx0geOXeX6krWZAwtmprH3AdkfdX7ghn9vlJXPvePF1KNKdakyl9i3LAHMV3g5M0KooyLS85tiEMRexIdocWwzx9D4iumFEmUrCUIEgMfwmFB7udfc7qHr2EzIHZ0MnSE0crSkyKm+MnfjU0yzEIWCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750338248; c=relaxed/simple;
	bh=9tRKKyo7bSvdhL4vlYIssi7N+tEenzKShSMnIn40CSg=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=ZSZnYLuqQKhmW4UeCWFMbsZ9/MwbMcL0sN6fzNQNubhwKcAuhGgyZ78+YXBy9qpDjVgabQ8il3VGrQofnUqH5mybC6DKgGTD2oB4OONegbdDQ4Ag2HU/TL1Ngsq8In9cwDFMhNngWEwQuZKtc6c5GrFAwBGDoIn305f10BvTteM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JDeSmUII; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=TPzdJga4; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JDeSmUII";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="TPzdJga4"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55J0fhTN013745
	for <dtrace@lists.linux.dev>; Thu, 19 Jun 2025 13:04:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=9tRKKyo7bSvdhL4vlYIssi7N+tEenzKShSMnIn40CSg=; b=
	JDeSmUIIJEwpiZKD4UukQWG5GwEq4kcKAr3JtPsfE7QBeWshS+am2ieLaXqL3fhY
	LQ1TDFCBcOOV8u1qA5QmF0+RdCgS4ab9iS5sM3a2t4aEpkHawT8jD/NOTNh+pRTQ
	sVZHyluyWcD/ElsMAVGICI3iWE7Tu4kIAGM+fHv7B7EzsLblNd0kGG/IreLI+wL7
	VvW9FWnq49jZUI1nhqRrK/NttZGMBjmO1b/Ant5klEaZ0/NJnYzOHRbYLfXuoAcG
	NKwRIKh9mlBKhARLYMIAWyV4QXhGoJlhrGvjG46yc9PWyCEpFFM0in5ebCZU0cpg
	nUeTWfXV2NtrA6yXr/nNUA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 479hvn99nr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 19 Jun 2025 13:04:04 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55JB1FWt038219
	for <dtrace@lists.linux.dev>; Thu, 19 Jun 2025 13:04:03 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2077.outbound.protection.outlook.com [40.107.237.77])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhbvrk2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 19 Jun 2025 13:04:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EpntVvYa48m/i8rijakypEmSnERNvLr1L1b3r9ipJki+1Cyqj/ReEnv6AIXJx9mDpHPlGTDLTazn1PXouwCGKJhAHEz2TSUDznTX62pPPuZ2i7Pmi20OHh1y43J9zOXxeEvRdlbtDHTc9cWYlT3mstOzMk0G29q55Dhzy+vyauY60Z2YtA1nAwXYpMo9acATF4RQRGRO/AB1nn4FN5qc7kO9IyQ3tTevrFCIUwlUVBqc4ovCOOA3w1bDumjnRJb43W5k7ypn7WX/9GiT13SBCEQF4mBQKOgQMSPNMH8LFyAX5fLEBZ3pQAj3cRv7qStjRJo43DabbTVTVbG74CWuLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9tRKKyo7bSvdhL4vlYIssi7N+tEenzKShSMnIn40CSg=;
 b=UCTE2PWUiFcd394E4S+bhoAc8FZ98WaffiYc3FtWIaeMsoiHJWMlCyBZ75NdkXx4qm8PupHChHaDTP25sdGeityhji/hJcpnjPFcOBDyVmns8z9IiIhhviLmXzlqvkVMGpjvVMf9n0mx9HVWGQkQznaa3mEHlxCDFSA+ewYureO2x1VDvMS92s0Z0+GqNQXsnCSr9Wz0tRNp/6qXci8pO+1oBN3LeOjs7LYaMOAgesi63qRAC64txQNVhr8JwRmSfOyLTBHUXCitsKGE1NJ+aMWcQiOtgz0JMTAkdp2F6uWkFGKgz13OYWpZP2O+naGy+OItA82QG8RmGeq/UKvYKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9tRKKyo7bSvdhL4vlYIssi7N+tEenzKShSMnIn40CSg=;
 b=TPzdJga4HKAQjrhknsxHIf+hdzlilZLvJ7y5Ttrw92cs+AuT0sFwJ0dfCYiI155+pEPoIGtXe7SzMro6d7Ty1dLmia0c+WeE21zbuJzWbd2TFG1/nItnxQHylBnPhLscaMvgOgLK71JdvI2O5sJbNYCziXhy862W81PNoakASAo=
Received: from BN0PR10MB5029.namprd10.prod.outlook.com (2603:10b6:408:115::16)
 by CO1PR10MB4404.namprd10.prod.outlook.com (2603:10b6:303:90::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Thu, 19 Jun
 2025 13:04:01 +0000
Received: from BN0PR10MB5029.namprd10.prod.outlook.com
 ([fe80::b85a:c2fa:6a79:393f]) by BN0PR10MB5029.namprd10.prod.outlook.com
 ([fe80::b85a:c2fa:6a79:393f%6]) with mapi id 15.20.8857.016; Thu, 19 Jun 2025
 13:04:00 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Nick Alcock <nick.alcock@oracle.com>, <dtrace@lists.linux.dev>,
        <dtrace-devel@oss.oracle.com>
Subject: Re: [PATCH 01/14] Fix stack-skip counts for caller and stackdepth
References: <20250522180118.27343-1-eugene.loh@oracle.com>
	<87sek3d83m.fsf@esperi.org.uk>
	<6cdb7118-e678-57e7-adff-a74a1ff39e19@oracle.com>
Emacs: no job too big... no job.
Date: Thu, 19 Jun 2025 14:03:56 +0100
In-Reply-To: <6cdb7118-e678-57e7-adff-a74a1ff39e19@oracle.com> (Eugene Loh's
	message of "Mon, 16 Jun 2025 15:21:09 -0400")
Message-ID: <87jz57zxvn.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
X-ClientProxiedBy: LO3P123CA0003.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::8) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5029:EE_|CO1PR10MB4404:EE_
X-MS-Office365-Filtering-Correlation-Id: 854b2966-5563-4943-a928-08ddaf31c1f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|10070799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RmMyWDFKdFRZN3g1L3JGVklBcTNFWHpteTFXNHZ6T3hEeGdudWVtMks2SmpN?=
 =?utf-8?B?WjhMUHNMdXVzN1d4U2JwYXVGQW1HTTRJWkN0ZzM3UWNQa0JZcWhZUmdLdzBv?=
 =?utf-8?B?a1prTnZTNTcvUnh0TU1wOVdUNzYrSVlsUkw1eFFMZlArOWtveWpOR29rc2V4?=
 =?utf-8?B?OElkVjhJLzZTbDJvMHNnWHdaTERmNGFhL2IwY2QxOFhGNlJtc1dEVURubHZ4?=
 =?utf-8?B?NjBIMm5aV1FPd3F4TngvNFNtT280SXh5ZkZaeVVhQytqWCtzRW92Tk4rTGhr?=
 =?utf-8?B?SjNkTnp4M3B2QUdCTzB3Y2dCbkNDTWZxTGhiM0RuTlhZN2JHSzhqaENjYita?=
 =?utf-8?B?MFB6UzdDNHJVVnpSWmVFdEU1b1lTSUJHbk1UczVadXFxdTlBQU5SKzRJYTlP?=
 =?utf-8?B?SE9rK3V5UFpDSUpnZ3J3emxDNGZ0YXpyVHEwblVPbGR0OGE5TU8ydHNJZk9h?=
 =?utf-8?B?QXNBWUliRlY2OFIrcTBVNW5TeUdNOTBSeFhIc0ZpRVFEQnlSbDFaTWxzd01h?=
 =?utf-8?B?MUlTRDVXTWIrTW1HWDd6Q2FnUXJ6T0xOOUlaa1VGQ2QrdlhZU1JCY1lWbGRO?=
 =?utf-8?B?RUlZQzF0R1pVWXRKZGVDYTUxWUg0ZTZtSFJYdi9jekQ0TzVKVVkvVjArU3ZY?=
 =?utf-8?B?S0podEpNMG9ucDBMbkhTSnlJSjk5emdqd20zMHNxTEt6dEVxNndQRGRZVW5j?=
 =?utf-8?B?UHIvdkkrbWc5QUhjK3NnQ245VTZqTGJyNUtrZTY5dVlQOU9KaVk3amUyenQv?=
 =?utf-8?B?V1F6aEpRazE3ZGh2U0Z6ODJJUXRJWGR5TW1wajk2dmNWQlFzQnJWVkxiemI5?=
 =?utf-8?B?QlVWQ1MvSHZWWHg4TE1VcytBSlF2cFF4RmtkZFBxZnh0ZTJoM1Y1NXdRM1Nk?=
 =?utf-8?B?ZVVyOFkxZUtGTzN3VlU1YmRrNHBqSk53NlZscXNFQWNwb3FybER6TWdoVWRF?=
 =?utf-8?B?TW03QXJBYmhySDd4TXJsaUNBUVdTSTJSa296OFNlM3JPYnVMd1NNTnlvRmhp?=
 =?utf-8?B?QnhqcnowaGUya2FveEt6Ny8yOWwzTjdPWFEra3pXOVppU3pYUG54TkU1eG1o?=
 =?utf-8?B?Y0RFUTBuQ1FrVHBLSEJHTm0rZ2tweWowYk1oS3h3czR6YXY0THFPdDVFNG14?=
 =?utf-8?B?eHNDUExzUTdSaGdrTmdHK0NFdzl1cloyb214OTJmM2lLaS9BeHhNRExpb0Fa?=
 =?utf-8?B?ckR6bWJNbjhOby9pTW1kMDI1c3ZWTTVpY1lMY2dLZHNDYkdYcVZLMlJQZ240?=
 =?utf-8?B?TnhpS1RPMjBocnQ4b0dUZHpEWWFSdnhTTkpWNzNHTWZIRWJ5SnVYUWxpeUZk?=
 =?utf-8?B?MThoblErTVdCcXNsSTZjaDYwQ0tVRmhrTURVTUpNL3JsM0xkRzZLbnNBYlZR?=
 =?utf-8?B?Zi9rT3VicDIyRitZbmdjZzY5czNkb1lHR1lCRXVhWkhoM215UTRJL3h0VkU5?=
 =?utf-8?B?THg4U3d6ZWRJMkpOMVJxdE56ZWp3U2VhVGlLaU1FVWJEMVRXRGtjK2ZKbGN2?=
 =?utf-8?B?NDQ5ZnZuM0F3Y3ZqMjh1a2s4L1JWNjdHUmN0c0JWUVJiUnRpVWo4RStpdG54?=
 =?utf-8?B?NUZrZWlqS2crRnlKaDAvdFhqWXE2Q1dHQjBqOEgxZ0JKaHN2TE5hblZzbzZX?=
 =?utf-8?B?MTAwTGNnZ2UzZHI2b1pDZmFtZVV6ZWhrczdLajc4S21FdWgrNFVVUzlpcHM2?=
 =?utf-8?B?Ymtrdm40dXROU1h3SFpWS0YyWWcwbVpZSnJ0Si9hMzZNdEhpcmI3ZkIvZmJD?=
 =?utf-8?B?akNaOVFaSkJPL2JVcTlwYXV2MkVwTHpWS2xtS2F2N3RhZTBOZ3FlbWJpMUdX?=
 =?utf-8?B?R0ZlUk9XOGpVMFZSMzVxSHZqS3pJaTdtczhyZmlPK3BZRzN5QXN1NFY2TmQ3?=
 =?utf-8?B?QldxYWh2QmZVRXN6ZHV5S1ZZb1RVUUc2cytoUm1oOGlxek9CMTFmQ0hrTUhu?=
 =?utf-8?Q?tqMGk5nVYRo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5029.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTlsWW40MjVZU1ZJWUVYcjV0THNxaDNGdTQ2Z0N2Snk0UTBmUncwc2hNa0V2?=
 =?utf-8?B?VVlWdHVXWjMveWtFamdQSHVLdU1TdnBOODk3bDQyWjRpU0hhdGxiZWc5a3J0?=
 =?utf-8?B?ZkQ1bG9BM0xSQjBZME5oR25vNndTQ0FaMTJyK2JsamJKNlRUaVBNaUczUjdk?=
 =?utf-8?B?WVhSZ1dxN3hhNVNLNXpPRjhybHdQUmZhT0hTbXN4Z0h1aFV6RnlwbHlSV3JN?=
 =?utf-8?B?ZWxJZ1Z1UWtLNk91WXMrcERrTHVBbkZwT2EzOWRMN1Ric0R5bUp3c0RHUGR1?=
 =?utf-8?B?VjQrY3RsR1VLZ3VvMmNUL1gvQkd0L1BHUCs1eExxUUU4cyt6L3VBOHl1R3NN?=
 =?utf-8?B?VEdMTVZxMmZzWlVDeHRRaW02dy9HSGZ3alZYL1JZY1Y3VUdEYmprdmFTR1ZI?=
 =?utf-8?B?WmRDemdIeFhJcnRkOUE0cmlmU21wejYwdkQzZlQvOG1PdTA3UENMdVFNUkM1?=
 =?utf-8?B?WVBkcUtEVHRnSGgwTWk1RlNzRHYzWm1CclJjYWw1L0ZROHBydFkwWWxYMVd2?=
 =?utf-8?B?enRzYWJNS29uTWd4UlpsaFF6ZzA0NnBZWFVNRURlSFRvL2FXeVRmQTFiS0py?=
 =?utf-8?B?dk90UEdpZGViOU5lK0szZlBwTzIveFBnREp3Q29PeXJlM3IvUHB5NmlDUUZ0?=
 =?utf-8?B?VFpEeEFXbU44MkFuQzllUzlCOXh1d0RTS0dSN1k1WTlab0RBdnhHd2J4azQ1?=
 =?utf-8?B?aWJMdmtrdFN3c1hIZEFpVS9JTDBOR2REMTQvSjAzSHJmUGZvakFmUms0MCsz?=
 =?utf-8?B?a2NFcGZVM2dOVGFLblY0MmhyY0tybVZncGV2ckJIV21TcUhlYkNmWFRCa2pE?=
 =?utf-8?B?MENkUzRGVmxHTDV0SUdlaE1jR0NMVmd6SHpzdDU1RW05N3VpYjc1TXdtWFVK?=
 =?utf-8?B?bng0bVZ3UVZQd2JyNGx5WjlqY0VITzA3RnNkQk91cEowMGhUcUptYndKaStE?=
 =?utf-8?B?SjNFTkExQk1Pamxkc2t3Z3E1WGNUTkNWRk1XRTYwSHU3bzJ2a1BFUmlaWFRX?=
 =?utf-8?B?NHBXL3BIa2lUQURtUEFEYWdTQ1JkcEhYZGZBRHZMTGttSlFIMk1wMWxrcDRj?=
 =?utf-8?B?VFM1RFY4UUNsZTNHTXhsTEtuclRRVUNTVjRZZ3o4WC9UMTJUYW53L0I2dy9a?=
 =?utf-8?B?dVVNY1pPMW5EWW0rV2xPYkYwZFpoN2xuOGhtVVk1Q05EWjhrQ2hhWlZ1NGpB?=
 =?utf-8?B?V0dNVndtWDcxZVBYWmhrZzkwU2ZPcU84TVY4SVl4VE01dVREWEg0UEJUV2Rv?=
 =?utf-8?B?OERxV1RGS0VwcllpcEZDUlZBUkhVRGUwVytlaVRHelNGRUwyRzU3ckkyMHFv?=
 =?utf-8?B?ZHdYRUJhRzVXOHlYQkI3MHpkcVh4Vm9lWmhXODBCQXJTd25tUUlySU90ZStF?=
 =?utf-8?B?WWtYeUJObjNNOW5RWkE5RGIzUE05dXJDcE5zSS9ZZGlZMjJtSzdtcmRzemJw?=
 =?utf-8?B?SXp4R3l1Z0owMEFBa3lKQ01ZV2ltckprd3RRdmZ6RkwraGU3RTMwazkzQWJk?=
 =?utf-8?B?OE0xSzlqaGdqbjBqQ1pZTTZ5UnJNWi8vYlpwUnZWakZuZkdPbkNhVWk0Z2g3?=
 =?utf-8?B?ell0eXQzSnFJZ1F2RzBCRzhSM0lnM2xNYzFLczJndzAwbmowMHBSYWV5Sm15?=
 =?utf-8?B?VUdkWGRRejNsUHJZT1VFSXIxeG9VUCtrTmFSU0FxQTNXQi9pYWVXU1IvY1dr?=
 =?utf-8?B?Y0RxZ1NsdWRlU0prZVJnV1NrZ0JrYm9KcEVpcExGWUtESUNraDlidGwrUUFy?=
 =?utf-8?B?UHBRRms2L2dOakdPTlhCUUJTWGdUMlZHODdjSFJkdWhKUitlWENQU3A2MFNl?=
 =?utf-8?B?S0w0SFJMdE1YaDd3a1A5cWhKb1M2WUtLQU43bTVUMk11R1h3emxSTHdYYXFI?=
 =?utf-8?B?VjJseFR5Tms3SS9CSFphQ28vS25LMjNJSm50MmJoRTVnVmJXWmxZU0NFcjZ2?=
 =?utf-8?B?bEw1UGxFdjJKOGVnc016QXFYS1d3WlpYTDJYdlRERG8yZlNFTnZWUHNIOW5G?=
 =?utf-8?B?Vno0OWJGQmFGOGJHekFIQ2dxWm9HU0gyRDl0YWE2dXJ3RmtWeTU2WUZpNisz?=
 =?utf-8?B?KzV0NmJHZTFOS3lEVFFxQVhscDdlNUI0YnlmaVJ6Q1JyMStFOWd0YVljbEJK?=
 =?utf-8?B?SkM2ZCsxMEszUGpvRE4xdTg4S0Q3ZUpSUkw5K1luRkhFNnFKTzducENacVJ3?=
 =?utf-8?B?UkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wWDMSFc8XPLtjXj8Bsx0tGsKz7kPYksosMAIrZ0z0Fw9H66RZeHzsSMJ86aTTKEg2IWEkKoLkGe6bBQUTCBXEAcCXw8ZFTvEBvf43aZ1PRuffNyShKDwHLZxU0LV13DLXdcbQ3PabtIDOXwiuztYnhViKQEykCiynDNTBumDHj3Rb4MhyNAyYejAeA2hZkYl7Abo/k0l0rQzpPvRu7I1ral7cKyv77WmDP35t9LrNkj/LnwpUF0DeIWjj+c1HgsaOztBlYvt52dEg/nWehlh+eBV4PHGvvgP9G/z9JF3ncP7NLJFkoo927qoK0MblEXA8B3mhQueFb6sQx8AEZ7oA5mLKws999lZpDtHYIUrOiIXk1T+sBByQDR/11VMPElQRlIkpOYJOvQf4lSbneWglttjZZdRDxFResuGapqjaXR+JhDIjpyxWV321RaWhMLnNmo3e/8PBbXOkBgQH1D1wVHzOHdf8EqFE39fh7yXX3Tio0OrjxD/JCrtEIn/3k1eIxNi5MtUJMHS/wqzBNCoCl6WuRMNC7Bq+rML3A8r3eIiBfl0pTuKpsgoquUAl5zDvgXRWaKgtjE47V61Hlm2Fsd8RRz/btJ2PLlKMvXvzso=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 854b2966-5563-4943-a928-08ddaf31c1f3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 13:04:00.9469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /0Sh9qL7PDIBd4P06QU6dGsoO9EgQBmOdG7hGpkgv/nXf5vp6z/GOxQJbH0fTaSbyxoR++DTerphWiW2wxXwVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4404
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_04,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 mlxlogscore=762 mlxscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506190109
X-Authority-Analysis: v=2.4 cv=XeSJzJ55 c=1 sm=1 tr=0 ts=68540ac4 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=47S--PeuQVadNSv3blAA:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13206
X-Proofpoint-ORIG-GUID: Pl6FDI8w9-SevaJPsigwCJXAukeYJzKb
X-Proofpoint-GUID: Pl6FDI8w9-SevaJPsigwCJXAukeYJzKb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDEwOSBTYWx0ZWRfX8wGgFYZqZaaB ijhEImv3JQyjRp6QTuevbQPk2PDRHWl3HZ++s0rLrMlFs/FCCFfN9AUI1jgdAA6oMHobXjuJDoV I6YhwE1GE/c9xbiSFUaolcXEwlesYV6kyCZ2Vdg+Looit6MFyC1pRqAnD4SuFtLc6iN6hVtprt/
 L5AsLGm+x36Vr3Wr61Ek5oYA721KlV6eN6ZrjEkg2YbhkO2qymtRKs5vA1pJD/D+vvjSfMyEOyc nJnAlFECVhzIpUnUjjxMsZNACpEH6WGr8tFqM3zCoS1h3jYyO//iR9GZhtTb2JuDvsSj0bu1jK2 PCSejDNvUYoxae0BdhTxHyr/pz49AAhUxkLD6WlzKweIOibxPIsliWZNhDm25ZG/bTz15lin/cj
 1FRPpvN9JT6Ds8UQ/kEoJKCC0WdFPU8zOPv3z8/sun/MSs41RIW5GIF8E/Rlnii0XwEnAsQi

T24gMTYgSnVuIDIwMjUsIEV1Z2VuZSBMb2ggdmVyYmFsaXNlZDoNCg0KPiBPbiA2LzEzLzI1IDEw
OjMzLCBOaWNrIEFsY29jayB3cm90ZToNCj4NCj4+PiBOb3RlIHRoYXQgd2UgZGVjbGFyZSB0aGUg
c2tpcCBjb3VudCB2b2xhdGlsZS4gIFRoZSBjb21waWxlciBtaWdodA0KPj4+IG9wdGltaXplIGNv
ZGUgdGhhdCB1c2VzIHRoZSBTVEFDS19TS0lQIHZhbHVlLCBidXQgd2Ugd2lsbCBzdWJzZXF1ZW50
bHkNCj4+PiBwZXJmb3JtIHJlbG9jYXRpb25zIHRoYXQgYWRqdXN0IHRoaXMgdmFsdWUuDQo+PiAu
Li4gd2h5IGRvZXNuJ3QgdGhpcyBhcHBseSB0byBldmVyeSBvdGhlciBleHRlcm4gZ2xvYmFsIHZh
cmlhYmxlIGluDQo+PiBnZXRfYnZhcigpPyBUaGV5J3JlIGFsbCBzaW1pbGFybHkgcmVsb2NhdGVk
Li4uDQo+DQo+IFJpZ2h0LsKgIFRoZXJlIGlzIHBvdGVudGlhbGx5IGEgYnJvYWRlciBwcm9ibGVt
LsKgIEJ1dCB3ZSBzaW1wbHkgZG8gbm90IGhhdmUgZXZpZGVuY2Ugb2YgbWlzYmVoYXZpb3IgaW4g
b3RoZXIgY2FzZXMuwqAgUnVnZ2VkaXppbmcNCj4gb3RoZXIgY2FzZXMgY291bGQgYmUgdGhlIHN1
YmplY3Qgb2YgYSBkaWZmZXJlbnQgcGF0Y2guDQoNCkFoYSwgT0suIEkgd2FzIGp1c3Qgd29uZGVy
aW5nIGlmIHRoZXJlIHdhcyBzb21lIGV4dHJhIHJlYXNvbi4NCg0KPiBUaGUgcHJvYmxlbSBpbiB0
aGlzIGNhc2UgaXMgdGhhdCB0aGUgY29tcGlsZXIgc2VlbXMgdG8gYXNzdW1lICZzeW1ib2whPTAs
IHdoaWNoIGlzIHJlYXNvbmFibGUgZXhjZXB0IHRoYXQgd2UgdmlvbGF0ZSB0aGF0IGJlaGF2aW9y
DQo+IGZvciBvdXIgcmVsb2NhdGlvbiB0cmlja3MuDQoNCkkgd29uZGVyIHdoZXJlIHRoZSBjb2Rl
IGZvciB0aGF0IGlzLi4uIHBsZW50eSBvZiBzeW1ib2xzIGhhdmUgdmFsdWUNCnplcm8uDQoNCkJ1
dCwgcmVhbGx5Li4uDQoNCj4gQ29uc2lkZXIgdGhlIEMgY29kZToNCj4NCj4gwqDCoMKgIHVpbnQ2
NF90IGR0X2J2YXJfc3RhY2tkZXB0aChjb25zdCBkdF9kY3R4X3QgKmRjdHgpDQo+IMKgwqDCoCB7
DQo+IMKgwqDCoMKgwqDCoMKgIHVpbnQzMl90wqDCoMKgwqDCoMKgwqDCoMKgIGJ1ZnNpeiA9ICh1
aW50MzJfdCkgKHVpbnQ2NF90KSAoJlNUS1NJWik7DQo+IMKgwqDCoMKgwqDCoMKgIGNoYXLCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqYnVmID0gZGN0eC0+bWVtICsgKHVpbnQ2NF90KSgmU1RB
Q0tfT0ZGKTsNCg0KSG0uLi4NCg0KZXh0ZXJuIHVpbnQ2NF90IFNUQUNLX1NLSVA7DQoNClNvIHdl
IGVuY29kZSBpbmZvcm1hdGlvbiBhYm91dCB0aGUgc3RhY2sgc2l6ZSBhbmQgc2tpcCB2YWx1ZSBi
eSBlbmNvZGluZw0KaXQgaW4gdGhlICphZGRyZXNzKiBvZiB0aGUgdmFyaWFibGU/IElzIHRoZXJl
IHNvbWUgcmVhc29uIHdlIGRvbid0IHVzZQ0KaXRzIHZhbHVlPyB1bmxpa2UgdGhlIHN0YWNrIG9m
ZnNldCwgd2UncmUgKnVzaW5nKiBpdCBhcyBhIHZhbHVlLCBub3QgYW4NCmFkZHJlc3MuLi4NCg0K
PiDCoMKgwqDCoMKgwqDCoCB1aW50NjRfdMKgwqDCoMKgwqDCoMKgwqDCoCByZXR2Ow0KPiDCoMKg
wqDCoMKgwqDCoCB2b2xhdGlsZSB1aW50NjRfdCBza2lwID0gKHVpbnQ2NF90KSgmU1RBQ0tfU0tJ
UCk7DQo+DQo+IMKgwqDCoMKgwqDCoMKgIHJldHYgPSBicGZfZ2V0X3N0YWNrKGRjdHgtPmN0eCwN
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgYnVmLA0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBidWZzaXosDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNraXAgJiBCUEZfRl9TS0lQX0ZJRUxEX01BU0spOw0KPg0K
PiDCoMKgwqDCoMKgwqDCoCBpZiAoc2tpcCkNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHJldHVybiByZXR2IC8gc2l6ZW9mKHVpbnQ2NF90KSAtIDE7wqDCoMKgwqDCoCAvLyBicmFu
Y2ggIkEiDQo+IMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXR2IC8gc2l6ZW9mKHVpbnQ2NF90KTvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8vIGJyYW5jaCAiQiINCj4gwqDCoMKg
IH0NCj4NCj4gSWYgeW91IG9taXQgInZvbGF0aWxlIiwgdGhlIGNvbXBpbGVyIGFzc3VtZXMgJlNU
QUNLX1NLSVAhPTAuIFRoZSBlbWl0dGVkIGNvZGUgaGFzOg0KDQood2hpY2ggaXMgYSByZWFzb25h
YmxlIGFzc3VtcHRpb24gaWYgbm90IGZyZWVzdGFuZGluZywgSSdkIHNheS4gV2h5DQpkb24ndCB3
ZSBjb21waWxlIEJQRiBjb2RlIHdpdGggLWZmcmVlc3RhbmRpbmc/IEJQRiBpcyBhbG1vc3QgdGhl
DQoqZGVmaW5pdGlvbiogb2YgYSBmcmVlc3RhbmRpbmcgZW52aXJvbm1lbnQuLi4pDQoNCj4gwqDC
oMKgICopwqAgbm8gcnVuLXRpbWUgImlmIChza2lwKSIgY2hlY2sNCj4NCj4gwqDCoMKgICopwqAg
bm8gY29kZSBmb3IgYnJhbmNoICJCIg0KPg0KPiDCoMKgwqAgKinCoCBvbmx5IGNvZGUgZm9yIGJy
YW5jaCAiQSINCj4NCj4gSWYgeW91IGluY2x1ZGUgInZvbGF0aWxlIiwgaG93ZXZlciwgdGhlIGNv
bXBpbGVyIGNhY2hlcyAmU1RBQ0tfU0tJUCBvbg0KPiB0aGUgQlBGIHN0YWNrIGFuZCBsYXRlciBw
ZXJmb3JtcyBhIHJ1bi10aW1lIGNoZWNrIG9uIGl0cyB2YWx1ZSB0bw0KPiBjb3JyZWN0bHkgZXhl
Y3V0ZSBlaXRoZXIgYnJhbmNoICJBIiBvciBicmFuY2ggIkIiLg0KDQpUaGlzIGZlZWxzIHZlcnkg
bXVjdmggbGlrZSBhIHdvcmthcm91bmQgdG8gbWUuIERvZXMgY29tcGlsaW5nIEJQRiB3aXRoDQot
ZmZyZWVzdGFuZGluZyBoZWxwPw0KDQpJIG1lYW4gaXQgZml4ZXMgYSBidWcsIHNvIEkgc3VwcG9z
ZSBpdCBzaG91bGQgZ28gaW4gaWYgbm90aGluZyBlbHNlDQp3b3JrcywgYnV0IHVzaW5nIHZvbGF0
aWxlIGlzIGFsbW9zdCBhbHdheXMgYSBkZXNwZXJhdGUgc3RpY2tpbmcgcGxhc3Rlcg0KYW5kIHRo
aXMgZmVlbHMgbGlrZSBvbmUgb2YgdGhvc2Ugb2NjYXNpb25zIHRvIG1lLg0KDQotLSANCk5VTEwg
JiYgKHZvaWQpDQo=
