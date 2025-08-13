Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BA22EA743
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 22:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755122971; cv=fail; b=sjpGQUlrhOJONmO7q+mW2TEX4Ef5b6QE5fMp4Z6Scyj5JHuBPeQH3dbWNPHsB2eiaMChVc1zeb2Muz4FX6Jb7DKU2uLxULhVAXDwUiS1IN8RxjF84kMYxsSEYoVLUs5b8yHSJAZsSst5/bcCmnrFI5H/lSztiDjhrQbn9c/KBGY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755122971; c=relaxed/simple;
	bh=/tuyn54SEo5L+L4m735EHwcYpY5UbqXwZNEl7Lzpn4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cKrV2iXLv2LYYZXq5L7zPlKpDaadjjxEdQ4uiQkWv7RUekXqJx9/v29RVTQvrPABEZSLRkIj83/jdddVJ4RmNfrdl3OiWXHZEYn6b70scnOegp4T9oBNlUhDZByDQFGrrRUCayRk9xrA7jaxSyr/wQd2YPRmRxrK0OC0JNHGbpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Zpa2e0Qb; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=m0Z5kYVh; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Zpa2e0Qb";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="m0Z5kYVh"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DLu3pB032066
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 22:09:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=MywMmfLdkrMblXTvUt
	ASyLTMeTLsW3PsdRZpE1qH5Es=; b=Zpa2e0Qbj+LNjDD//Pk1ADecwkiY5lSu4Y
	nuUB5bAbLx+IrDkUSfhZrf/1Z6/VF1PFDRvEZ+Q1wskILJm8fPoYlVeUIYf3C4Pp
	egccPEgwt+qJXkU8R2//IwHYMzO/4VWKmYv2ZzBGqpduMh3aumdUUN3o/SKARZka
	c2WfVENj9YtjIAt+U+Cfh4PlDVvHODGe20zCfJiOARDxhxlz+VvPcB7/T9Z9cLZf
	Mp4aDxTZxLq376Q7wg/0BPrDTKPtNoC/cCs38NcQ3Qr3d/0RcQcVEe6N0BJGOEID
	xqb7OznRF4BoTB4hYmjmLndC2A2UF+liNg2p+l7UvcS0rS2wUTGw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48guch925e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 22:09:28 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57DLlDAk030183
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 22:09:27 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2049.outbound.protection.outlook.com [40.107.244.49])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48dvsbyf0a-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 22:09:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RoleL6pUvDnKtbvngLOOiXm9snUgAsRoyQpWY59Rp+OiiUm0BqLR1WPBr5up8qNWGwfWuxHDcCNNu1Lygx/VgQA5rkaslRIcrDs8SR2trgDc30JIaqvUsLKsVAY/QSf9faUwr+nMD/6vZ36ARh8QRx642baynRdNyEsAr6LXbbk5sD5gj1Oc5fTTXLmhI5OBLtja4SKY7WZMziTHhiP/HEBnvva7KO5I4UVQjQpg4WK2QfhAwSG+Dp6mFZ4ydvHwJ++fn0BYCbMgReaG003BXd6BpLzdx2qozL3ANmFDDG1wY6Q6xTsJkq5Z96RWovoosBAem5wbx1OroY3OAoDzdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MywMmfLdkrMblXTvUtASyLTMeTLsW3PsdRZpE1qH5Es=;
 b=gmZrRIlSOR8KllamX51GYOSdRSeMnDBzDeivqVYg3t7BWS4uInImi5TtmaUb9diGt7QNEYUY6ia3VItHqBfhasRtvmZiMfA3Vt76vM+JZm+maqsPFSR7sPDUO/Uc9vzbNOgYfmw3jFWpJj6YoehjAI3XuhAqn5BLsv9u3dhySJFZEkT2PrOKlFq8dqg/p1GZ+3UzrxSRnRlncQB8UnuVR3mj8uAGEssQz/hHm9/6bjDsVSyYChmn1f/nleFY+g9T0XWCGWi1/qg1z9YYmIOvAQdWHLH8gBczwTtHRZDPCsMnEXyWXO/5C9TXKxYsZ6PRHC7HzBRA9syybcgSA0z37w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MywMmfLdkrMblXTvUtASyLTMeTLsW3PsdRZpE1qH5Es=;
 b=m0Z5kYVhO1G87O/ECfBKhKG9ACtMg3FuEnQSeJIuit0ZfQlw2WzhgzreBtjllS/ah/xCxY/F0gLvJYbJohrPa67x57ILLTnNwt7SE7YxMJur+n0okqpfbnh6hq6ycv/eVnTwPwJPRJjz+nilyru16y/SKqFCwP8oAkiV8YbrCgk=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by CH0PR10MB5148.namprd10.prod.outlook.com (2603:10b6:610:de::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Wed, 13 Aug
 2025 22:09:24 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9009.018; Wed, 13 Aug 2025
 22:09:24 +0000
Date: Wed, 13 Aug 2025 18:09:20 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 5/5] string: ensure string size is handled
 correctly
Message-ID: <aJ0NEMc2msMNKoRf@oracle.com>
References: <SJ0PR10MB56727E2012F343B19177481BC22AA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SJ0PR10MB56727E2012F343B19177481BC22AA@SJ0PR10MB5672.namprd10.prod.outlook.com>
X-ClientProxiedBy: BLAPR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:208:36e::6) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|CH0PR10MB5148:EE_
X-MS-Office365-Filtering-Correlation-Id: 73b2cdb5-1d3c-478c-dfa5-08dddab60fd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/ViFk7WBzRL6fpf3v9NRvizynHItEo11s4mXVp7JAAkYqixOr3ioSWTreqCJ?=
 =?us-ascii?Q?RS4NIlpa/NZdJq61UQbmnR5X6/n7Vp05u/iaNdjxNUkdRgtZbiOTIiwNi0cl?=
 =?us-ascii?Q?d3w6Zfl4WgKxhbV6ovFmR488+HjWBBYWd/d0s+K6NSuZkrhON5SaWC0gvGZa?=
 =?us-ascii?Q?Qxn343kjOBkvFXvveL+ETOZyce3FT1iZrNXoInAVZfWCef/gNWEnghDnJtRl?=
 =?us-ascii?Q?x6U58uukKwvr/G2Ko/LtFQ4aY3K2qUviVkyuCkD6KF0D/qr6Xui1Ou3HSc9O?=
 =?us-ascii?Q?aqwoTd/fR9x6xvHVsWxo6bmpKmTl0dBjR9IVK+WpB2Db7l9XSsffIbXeKbGQ?=
 =?us-ascii?Q?UvJEee55YX/cerGryqEJ6erE9aGFRgCgzMRwFAuXlHwBGu9GH1VbGBdlMwCc?=
 =?us-ascii?Q?2WRR3LYwr2W8hgI4aBHCGfrdsFnNumSQB4ips7/HFR2yDfSUMCoUzOECW/qh?=
 =?us-ascii?Q?EZhrCs0WurIqgNQNyOlxbUIXLCVMEupeLVEbjRmw3CD1zkwMB/OFDUVxVLcC?=
 =?us-ascii?Q?JiuJ6klE5YaUobIGTN/ezUSZntg5SWoEYaTihJHXIj3gCnUGHP2VobF5SQS2?=
 =?us-ascii?Q?D6WZ6DcA9pC9EFiBRucRYl2Co2i3tSp7bOTKidsszf/yWJz+hW1uNnNz/HMM?=
 =?us-ascii?Q?xcFPEDDx/VKCUfhrd/mBYaL2GBp0PQQffrKdwXxVaM4YqIUyscf2TayAnO9u?=
 =?us-ascii?Q?NLp+Kg7QAVo4acOttNXZKMaZa7SdgfyBDhfhj+CB33AiVICbckC/8EmXkZX7?=
 =?us-ascii?Q?5D2KkMYjh7+8K4oPduLQ0GUAHgkccV/nXxM4xDMYR2j9pd6EJyA8Mve6raVg?=
 =?us-ascii?Q?CXeSERIG4nIBAI05SecI45aiAvzq2Q984p99wk6oVjCBOi3j/2DJfLHPgcWg?=
 =?us-ascii?Q?hBCHCF+BTyopUDoF1fYM52a+tfjs1WhynS7dYsKEoIKHi6mDvlnDVSZkRVA7?=
 =?us-ascii?Q?VYGdbLmP+hImU3fOfukOQSjLGaC5I3dOGw8hGSzI+ofEolEMV65d3iK6Gkjm?=
 =?us-ascii?Q?DMGGs0fIM+FV3V1UhJqEk5gDnBb8sy/WBid9Gq0W2vkwmwxPCyCP5Q77pfcL?=
 =?us-ascii?Q?8UFP1TG3H1kCXoPrK8ZID1YSehOPP3kdoRLPbG2dOeCH95SINgZRmH4YPDbk?=
 =?us-ascii?Q?IFKnaRoliZBRVBgomjrK3yWp8hIq5192ntBvJNuxYi2VbiDnVD9100DFsE98?=
 =?us-ascii?Q?BFltteG779iDfo3r8Yx1Nk3e6g6Ve8l8sRXKjlQe4zT+mOfTBw+ad2T3F6JB?=
 =?us-ascii?Q?6cUTjluqT5S4ON9FWwBNo0WsHH/05ovQCBfE7ZBVjszRSiThg13rb8AikNUU?=
 =?us-ascii?Q?T6wG5LeJcycfum0WpHoGb/GAqVUdWg+DSVDqY5fH2G/l/VJ5Tni0siRKkg+F?=
 =?us-ascii?Q?zCVtzna4PylgmDBS6/qbQnhu/cBnMoRS6KP2/el6t8pWNXuChYPFcfSO08k6?=
 =?us-ascii?Q?7Qn7IjQ1xME=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?R/fYHlHES3I2JvEAlgryBSbQPNd23aSQmeELqEcsry16qUFMR8YP+wlDOrRp?=
 =?us-ascii?Q?X/s5khNFsu3VC6VpGeQ5bliUmr6EYyb9WpVwSC5Dr2OYL7Chd2BZgcQMYakF?=
 =?us-ascii?Q?mMnx+g/U+eXlJNDRsR+TwXog3F7pBa80l2UyBRWPFZj5vvVLiwxzv03Qb45I?=
 =?us-ascii?Q?CtieZg9VP2mPXXNSPSxc20zJ0eJsJUN+KBS3R/QQwhvzy8A8sxUlx0y27QmZ?=
 =?us-ascii?Q?npMsOUH4561ZJUDrEDfp64b584aSNXdH4tVuoixeTsXsCq4cionJTs5JqzdB?=
 =?us-ascii?Q?QsbDA3nPpSw3Bvz8Kip8tCgfliJx0RzMftK0jaNhS4cm9SW29qwh5bpakMDx?=
 =?us-ascii?Q?qutqCShB82MIDmppWao4zCxhVuWyEr+/cGZvvvZr4ieWI2ui+/SnA7svPRMW?=
 =?us-ascii?Q?TnvVpqJr+5Rzx5c7x3oFS2VzQRTX9jKoCP2eRPdlWXBfgdjN9Ds+YlTCuWzJ?=
 =?us-ascii?Q?zc085O+8fbBp6cwQ9xMhsHEAGjqcPB6BuF/YBc7dYwHbwYqLOQRf+EJuyJNf?=
 =?us-ascii?Q?gdTdxwSr8n6jatsE00zYVtoDQ3VeAzVNiiqSzSL4QuuTZopccVSWE0SxaHfC?=
 =?us-ascii?Q?6+xrbYfSXolCYxfeaKJVXNxCTcbJaxXC/U5eT9ST/rMfp5pDtC7SYgHlyFs8?=
 =?us-ascii?Q?V4uiVq9bfYmth6udo4DDQ/scyTfVDQ9SajHQsr21BnMSZ4TZX/hEa8YexZdg?=
 =?us-ascii?Q?T9ZDxyWzWLGiWbLuoPt1nyXr2GKkBVTg4GOg5xSPpDKfIaCBdLgFvXUbfjNE?=
 =?us-ascii?Q?LZmZ1oSAD2BLmdBuLuGPZVsZEHgCl372JONIfmBzn9HWh7B8Ce03dtbRX21h?=
 =?us-ascii?Q?zJEMMIfmX0SxqBYXnTeH04NHZ1DcDEChXNohlVmurBh/nglT+O0NsVf2Mnqj?=
 =?us-ascii?Q?ZNSz95lfFd2xxDzr67w9wqTRpuV2026oFT982RnOKPG6UoSLHmajVhSegDU+?=
 =?us-ascii?Q?Yag2/fDKuHs5BPnW2Kl+uOwOkSmBrqF5hKjvjGP3tHWyOcXtT9A47oujQLiv?=
 =?us-ascii?Q?gOa44nqZ80rZ2D1l1Dgrfyor44H/BGdlHt6HtEVMYa79igE2ufiU2ZROu+tY?=
 =?us-ascii?Q?4/MD63GLJJwjlNF2+q12KuL4pFffoW+xsqy8GljENJwuQULmv0fLkdNqdlwe?=
 =?us-ascii?Q?gq3mchYGJ/gxcstGjKDjj01YTe0iqTT04C73Gv7AIdEfOKSHU0leNsAThQsi?=
 =?us-ascii?Q?FNaGi4jxi/QeAHYdxQP6/nSZATrH0aH8AqPjG0cChNrJP+Ex5CM0nGKNSxPo?=
 =?us-ascii?Q?AC1gGDOfiTdbLVUHy8vpW+J06mMIt+9RibT7zgx0JQi6ZBwKa8BCArA+hU/x?=
 =?us-ascii?Q?Y+CrRlyZ1VA/VwW8TM8DsnxEoKZLMBSZf402KqB0CCH/Hs29c8LG0ZSjfEGq?=
 =?us-ascii?Q?cEyv7FFJt/WawkLRSQCvc7ujphPYv5yuYuHDyxjrLuxrpAeskU3RNViGVikZ?=
 =?us-ascii?Q?HkWbqhrOo8vc5t54FUPZLqZPmrEONYjSpVARNpjYSdbM4o2FOE+E9/3+IJvv?=
 =?us-ascii?Q?d4SfwOWUUb/6xiHR9AGciryAetVhY42n3c4OXr8h8FUqMxVHyW9iglG25jLR?=
 =?us-ascii?Q?84k81qwZwwUeTkmCWTQxCw9rxCm8V51H/SjLqrW/K5RcHTNPVzD+exgTBC5g?=
 =?us-ascii?Q?CA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ccsOjYVSyESFBrnGLRhKL2J4AdlKMOcVG2sQFAuBdjCJVTkY0U11ddaiyEJaq4lbYreKaF6wNnEySJU7rHOjB+nGvn2kFXIEWWu8Aa7S014ZOW77TBX6YO9zPOOWJPrkB+Ezz3ddvTxDq9iyvPe/dQvQXysLiw0p9iojoEUPoF7S9bHsdZtv4PkbusvMuOIHQk/DWWyoYQ4iJd/kj9RlBv3NJt6EF98mVlqerOdGSw+GcEv8xZJV4bohI9HbJR1y8fr+esgnOl6wmTbd/uvQ27FB7uY26IccoBH+iZWrwCixCN66H1KCuTIb0eUUTLeAFnkEai4I3LUEIOIY4Qfoj/bYWx6Wc/rNyeY2fRwTxXWRoMs2b5336LisCqnTDZ5GPktksinED9nGgIV+uXgawMMnL884FHFnjon/UJntc1PuO0xqQa7ipYOx+X5sqqHcuIRN5wE9q9isB5jGH/m964fUs2fEub4JixDKzkFVaKX3f+/FVl+MctT2rvnsbM157jLmCm1nv/n+ZmD5cIoZujUPB3xHHs38SpVG26Poju4U0RbsFysCXJHeBehIuxnEiAzzA2VL3qDBEJpuM8PBdLLnwUfomsGqPkEgwi2K5v0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73b2cdb5-1d3c-478c-dfa5-08dddab60fd5
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 22:09:24.3132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gw+R9UY74aGfHLidYeSLjk7Qlx7ySg/WBQHZM9DDW3eDIvylitJLxwlf5/HnNwxN2WKYMgc0QqgszDtuLpg/FWwjAUBtLjnGSqhXdCOp0fo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5148
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 adultscore=0 mlxscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508130206
X-Authority-Analysis: v=2.4 cv=Eo/SrTcA c=1 sm=1 tr=0 ts=689d0d18 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=HMny1IB7lA9h6EMpW4UA:9
 a=zaDm8kx9EmDbiU77:21 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: 6_BIJ7_UNu3cpgvkCTKwnIeXF0yYkwMq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEzMDIwNiBTYWx0ZWRfX51bM2UdeMjOQ
 MqNTiU+mvVvR0ax46MQuoXIaL+L2YwMTaN+h1jTyLw8HUKAFLSi9ELCEs7MQRTYzerNoBv+/rBg
 4i0wQmtOrO5SxSGCLB8jlsd45eNExNotskifF9m/Cf9ylEQ+wqia+TGCapHELl9TxQb05EA2Fmu
 fZsxX3rxo9Nny9oknTEd3HjizhpIBLWs/t1+u2PH3rpi0r1xT1cPThde1CHqLvIYymPYB8b4lB+
 meZSCsGF9jnXeb11uVGAFg+tvBgWpaMAS9ZjQ4fI6wgqj1h8IokzDdFTbjXt57VGqrklOdcKFbu
 9JvTZbib+rx2EB50Phf4Xt1Bn/QUEMNnKrx8F5irnxwuYn87YqHc04w7uZKkGUpYDHmERsb3Jd/
 xPl9fc1QCRsW1m3ynZ2+G8D2FbSwcXNT6G4ZmeWh5Pq7AoFGljuCeHnwWimsVJ2nlj3xVS/v
X-Proofpoint-GUID: 6_BIJ7_UNu3cpgvkCTKwnIeXF0yYkwMq

A v2 coming soon - I needed to cover a few more cases of tests that I failed to
notice.

On Wed, Aug 13, 2025 at 11:57:33AM -0400, Kris Van Hees via DTrace-devel wrote:
> A string is defined as a character array of size strsize.  Strings
> that are less that strsize in length are terminated by a NUL byte.
> This implies that the NUL byte is part of the array and therefore,
> strsuze is indeed the size of the array and not the maximum number
> of characters in the string.
> 
> Tests are adjusted to reflect this behaviour.
> 
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>  libdtrace/dt_cg.c                                     | 11 +++++------
>  .../funcs/inet_ntoa6/tst.inet_ntoa6.strsize_10.r      |  6 +++---
>  test/unittest/funcs/strjoin/tst.strjoin-bordercases.d |  2 +-
>  .../funcs/strjoin/tst.strjoin-capped-size-2.d         |  2 +-
>  .../funcs/strjoin/tst.strjoin-capped-size-3.d         |  2 +-
>  test/unittest/funcs/strjoin/tst.strjoin-capped-size.d |  2 +-
>  test/unittest/funcs/strjoin/tst.strjoin_nonDPTR.d     |  2 +-
>  test/unittest/funcs/strtok/tst.strtok_long.d          |  4 ++--
>  test/unittest/funcs/strtok/tst.strtok_long.r          |  4 ++--
>  test/unittest/funcs/substr/tst.substr-stored-len.d    |  2 +-
>  test/unittest/funcs/substr/tst.substr-strsize.d       |  2 +-
>  test/unittest/funcs/substr/tst.substr_nonDPTR.d       |  2 +-
>  test/unittest/funcs/tst.basename_nonDPTR.d            |  2 +-
>  test/unittest/funcs/tst.inet_ntoa_nonDPTR.d           |  2 +-
>  test/unittest/funcs/tst.lltostr-short.d               |  2 +-
>  15 files changed, 23 insertions(+), 24 deletions(-)
> 
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index 88dddb087..cd9e7f4e9 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -1741,11 +1741,10 @@ dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
>  			dt_cg_check_ptr_arg(dlp, drp, dnp, NULL);
>  
>  		TRACE_REGSET("store_val(): Begin ");
> -		off = dt_rec_add(dtp, dt_cg_fill_gap, kind, size + 1, 1, pfp,
> -				 arg);
> +		off = dt_rec_add(dtp, dt_cg_fill_gap, kind, size, 1, pfp, arg);
>  
>  		/*
> -		 * Copy the string data (no more than STRSIZE + 1 bytes) to the
> +		 * Copy the string data (no more than STRSIZE bytes) to the
>  		 * buffer at (%r9 + off).  We depend on the fact that
>  		 * probe_read_str() stops at the terminating NUL byte.
>  		 */
> @@ -1754,7 +1753,7 @@ dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
>  
>  		emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_9));
>  		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, off));
> -		emit(dlp, BPF_MOV_IMM(BPF_REG_2, strsize + 1));
> +		emit(dlp, BPF_MOV_IMM(BPF_REG_2, strsize));
>  		emit(dlp, BPF_MOV_REG(BPF_REG_3, dnp->dn_reg));
>  		dt_regset_free(drp, dnp->dn_reg);
>  		dt_cg_tstring_free(pcb, dnp);
> @@ -1765,13 +1764,13 @@ dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
>  		/*
>  		 * Pad the rest with zeroes, if necessary.
>  		 */
> -		emit(dlp,  BPF_BRANCH_IMM(BPF_JGE, BPF_REG_0, strsize + 1, lbl_ok));
> +		emit(dlp,  BPF_BRANCH_IMM(BPF_JGE, BPF_REG_0, strsize, lbl_ok));
>  		if (dt_regset_xalloc_args(drp) == -1)
>  			longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
>  		emit(dlp,  BPF_MOV_REG(BPF_REG_1, BPF_REG_9));
>  		emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, off));
>  		emit(dlp,  BPF_ALU64_REG(BPF_ADD, BPF_REG_1, BPF_REG_0));
> -		emit(dlp,  BPF_MOV_IMM(BPF_REG_2, strsize + 1));
> +		emit(dlp,  BPF_MOV_IMM(BPF_REG_2, strsize));
>  		emit(dlp,  BPF_ALU64_REG(BPF_SUB, BPF_REG_2, BPF_REG_0));
>  		dt_cg_zerosptr(BPF_REG_3, dlp, drp);
>  		emit(dlp,  BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_probe_read_kernel]));
> diff --git a/test/unittest/funcs/inet_ntoa6/tst.inet_ntoa6.strsize_10.r b/test/unittest/funcs/inet_ntoa6/tst.inet_ntoa6.strsize_10.r
> index 5e7d49b03..8090daad6 100644
> --- a/test/unittest/funcs/inet_ntoa6/tst.inet_ntoa6.strsize_10.r
> +++ b/test/unittest/funcs/inet_ntoa6/tst.inet_ntoa6.strsize_10.r
> @@ -1,8 +1,8 @@
> -fe80:7060:
> -1080::808:
> +fe80:7060
> +1080::808
>  ::1
>  ::
>  127.0.0.1
>  127.0.0.1
> -::fffe:7f0
> +::fffe:7f
>  
> diff --git a/test/unittest/funcs/strjoin/tst.strjoin-bordercases.d b/test/unittest/funcs/strjoin/tst.strjoin-bordercases.d
> index 253b2d6ef..1ac5ffd12 100644
> --- a/test/unittest/funcs/strjoin/tst.strjoin-bordercases.d
> +++ b/test/unittest/funcs/strjoin/tst.strjoin-bordercases.d
> @@ -6,7 +6,7 @@
>   */
>  
>  #pragma D option rawbytes
> -#pragma D option strsize=5
> +#pragma D option strsize=6
>  #pragma D option quiet
>  
>  BEGIN
> diff --git a/test/unittest/funcs/strjoin/tst.strjoin-capped-size-2.d b/test/unittest/funcs/strjoin/tst.strjoin-capped-size-2.d
> index 625c786b6..44a6acd88 100644
> --- a/test/unittest/funcs/strjoin/tst.strjoin-capped-size-2.d
> +++ b/test/unittest/funcs/strjoin/tst.strjoin-capped-size-2.d
> @@ -6,7 +6,7 @@
>   */
>  
>  #pragma D option rawbytes
> -#pragma D option strsize=6
> +#pragma D option strsize=7
>  #pragma D option quiet
>  
>  BEGIN
> diff --git a/test/unittest/funcs/strjoin/tst.strjoin-capped-size-3.d b/test/unittest/funcs/strjoin/tst.strjoin-capped-size-3.d
> index 52718325a..d2982a70b 100644
> --- a/test/unittest/funcs/strjoin/tst.strjoin-capped-size-3.d
> +++ b/test/unittest/funcs/strjoin/tst.strjoin-capped-size-3.d
> @@ -6,7 +6,7 @@
>   */
>  
>  #pragma D option rawbytes
> -#pragma D option strsize=6
> +#pragma D option strsize=7
>  #pragma D option quiet
>  
>  BEGIN
> diff --git a/test/unittest/funcs/strjoin/tst.strjoin-capped-size.d b/test/unittest/funcs/strjoin/tst.strjoin-capped-size.d
> index fe5b323f7..b54fd2f29 100644
> --- a/test/unittest/funcs/strjoin/tst.strjoin-capped-size.d
> +++ b/test/unittest/funcs/strjoin/tst.strjoin-capped-size.d
> @@ -6,7 +6,7 @@
>   */
>  
>  #pragma D option rawbytes
> -#pragma D option strsize=10
> +#pragma D option strsize=11
>  #pragma D option quiet
>  
>  BEGIN
> diff --git a/test/unittest/funcs/strjoin/tst.strjoin_nonDPTR.d b/test/unittest/funcs/strjoin/tst.strjoin_nonDPTR.d
> index a1816f975..2b700a5a8 100644
> --- a/test/unittest/funcs/strjoin/tst.strjoin_nonDPTR.d
> +++ b/test/unittest/funcs/strjoin/tst.strjoin_nonDPTR.d
> @@ -6,7 +6,7 @@
>   */
>  
>  #pragma D option quiet
> -#pragma D option strsize=14
> +#pragma D option strsize=15
>  
>  BEGIN
>  {
> diff --git a/test/unittest/funcs/strtok/tst.strtok_long.d b/test/unittest/funcs/strtok/tst.strtok_long.d
> index 1fbe415dc..254a65485 100644
> --- a/test/unittest/funcs/strtok/tst.strtok_long.d
> +++ b/test/unittest/funcs/strtok/tst.strtok_long.d
> @@ -9,8 +9,8 @@
>  
>  BEGIN
>  {
> -	/* 256-char string ending in "XYZ" */
> -	x = "_____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________XYZ";
> +	/* 256-char string ending in "XYZ" (255 chars + NUL byte)*/
> +	x = "____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________XYZ";
>  
>  	/* check whether the last char of a long string is seen */
>  	y = "a";
> diff --git a/test/unittest/funcs/strtok/tst.strtok_long.r b/test/unittest/funcs/strtok/tst.strtok_long.r
> index a752554e8..4b172ca1b 100644
> --- a/test/unittest/funcs/strtok/tst.strtok_long.r
> +++ b/test/unittest/funcs/strtok/tst.strtok_long.r
> @@ -1,5 +1,5 @@
> -_____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________XYZ
> +____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________XYZ
>  zyxwvutsrqponmlkjihgfedcba
> -_____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________XY
> +____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________XY
>  Z
>  
> diff --git a/test/unittest/funcs/substr/tst.substr-stored-len.d b/test/unittest/funcs/substr/tst.substr-stored-len.d
> index 97d2b0f61..fa3e5337c 100644
> --- a/test/unittest/funcs/substr/tst.substr-stored-len.d
> +++ b/test/unittest/funcs/substr/tst.substr-stored-len.d
> @@ -13,7 +13,7 @@
>  
>  #pragma D option quiet
>  #pragma D option rawbytes
> -#pragma D option strsize=13
> +#pragma D option strsize=14
>  
>  BEGIN
>  {
> diff --git a/test/unittest/funcs/substr/tst.substr-strsize.d b/test/unittest/funcs/substr/tst.substr-strsize.d
> index b4d0cc63e..04eab4297 100644
> --- a/test/unittest/funcs/substr/tst.substr-strsize.d
> +++ b/test/unittest/funcs/substr/tst.substr-strsize.d
> @@ -15,7 +15,7 @@
>  
>  #pragma D option quiet
>  #pragma D option rawbytes
> -#pragma D option strsize=13
> +#pragma D option strsize=14
>  
>  BEGIN
>  {
> diff --git a/test/unittest/funcs/substr/tst.substr_nonDPTR.d b/test/unittest/funcs/substr/tst.substr_nonDPTR.d
> index 9d847ab6f..3e10af08e 100644
> --- a/test/unittest/funcs/substr/tst.substr_nonDPTR.d
> +++ b/test/unittest/funcs/substr/tst.substr_nonDPTR.d
> @@ -6,7 +6,7 @@
>   */
>  
>  #pragma D option quiet
> -#pragma D option strsize=13
> +#pragma D option strsize=14
>  
>  BEGIN
>  {
> diff --git a/test/unittest/funcs/tst.basename_nonDPTR.d b/test/unittest/funcs/tst.basename_nonDPTR.d
> index 4f93685f7..cecef827b 100644
> --- a/test/unittest/funcs/tst.basename_nonDPTR.d
> +++ b/test/unittest/funcs/tst.basename_nonDPTR.d
> @@ -6,7 +6,7 @@
>   */
>  
>  #pragma D option quiet
> -#pragma D option strsize=14
> +#pragma D option strsize=15
>  
>  BEGIN
>  {
> diff --git a/test/unittest/funcs/tst.inet_ntoa_nonDPTR.d b/test/unittest/funcs/tst.inet_ntoa_nonDPTR.d
> index 500c53e86..f079c7ef4 100644
> --- a/test/unittest/funcs/tst.inet_ntoa_nonDPTR.d
> +++ b/test/unittest/funcs/tst.inet_ntoa_nonDPTR.d
> @@ -6,7 +6,7 @@
>   */
>  
>  #pragma D option quiet
> -#pragma D option strsize=14
> +#pragma D option strsize=15
>  
>  BEGIN
>  {
> diff --git a/test/unittest/funcs/tst.lltostr-short.d b/test/unittest/funcs/tst.lltostr-short.d
> index 969045667..65a5714c2 100644
> --- a/test/unittest/funcs/tst.lltostr-short.d
> +++ b/test/unittest/funcs/tst.lltostr-short.d
> @@ -6,7 +6,7 @@
>   */
>  
>  #pragma D option quiet
> -#pragma D option strsize=7
> +#pragma D option strsize=8
>  
>  BEGIN
>  {
> -- 
> 2.45.2
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
