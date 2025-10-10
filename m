Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F041E26B2CE
	for <dtrace@lists.linux.dev>; Fri, 10 Oct 2025 03:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760067234; cv=fail; b=sytC8sNpziaIsd96u11WI+i7vJ5/27Rq0Pvh8LE8ppHhPh2V3PbIwSCjVkRlOlpuV4xi8k40wSt09Gj5j6Uwe1Wcq/z/RGCx1uXdyx48ZmIRih4QeZ02J1CCiWWklW0Ca+RY3hBUzmMD0B3RlKVqZ6UTQym80jybulxDbIczZVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760067234; c=relaxed/simple;
	bh=JgyMClN218aggFveRnrYnAb1fwiieADHf732avRve+c=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=QBGnQltuvmdIh5ZGo4pRtcqj2cj+43r4sO2SMXCyHH3L7KJRP+rslyet8nm+/yjBf4CgBHOQlUg0N06NCzXiMORMVps0IC0ZXfbXS50MBUsUhZW+mBRaaQ4RaGV3pYA6QOFCsTTFVVyfuZFV1LRr+hZrgGuaN2VkKYFyjMnZ1Go=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FUfc/qgc; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=EkwPjkB/; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FUfc/qgc";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="EkwPjkB/"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59A1PpYp018832
	for <dtrace@lists.linux.dev>; Fri, 10 Oct 2025 03:33:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=G8z6rJJJx0UsCJ8DXyqAdsfBW1rzB+OzENAEairDrXA=; b=
	FUfc/qgco4JdNkkq2WtUEIvwNGdXuxSeVEqKLPE5LHC6cqIQlkKzPVIQCz0T15FE
	pnoOC47cIf0wDmIBw1i44J0Riabuc/G/cwHUc6MzpzRB3RRSG44yn6p8d5IcrMvH
	wF2w1QTzGHw5UxGQ+eD4NqlDWB9aKUxvanJAhzbIF/L36ezTi/BtHzIY3ayKi0Yq
	TiYLF2QlgF+YjhC7Uz4OmZ1fnTHhNu4kiaiIs52arIHsL++C74xrjaImTtP63E3a
	viq5jHJDzI/cCYK0M3NXCHSBRjYVtjQr9PzqF89b1XpdXB7VxXvBGbKTk6mIkEzB
	Z7jjPABNnPqk5go/NgLD8w==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49nv6bauxv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 10 Oct 2025 03:33:50 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59A2EQGI036896
	for <dtrace@lists.linux.dev>; Fri, 10 Oct 2025 03:33:50 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012042.outbound.protection.outlook.com [40.107.200.42])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49nv68fm8e-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 10 Oct 2025 03:33:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IQUiVDwg6AHMt48lrQeK74JEGAvh7JnchMmy49BOnAyB+lhvew4fBmVcGoEn2IxbXYJh6fH3HA0dSp0BErlZH27go89xkLqOz787nZydDPqtInXbpHAK/gYsGeakAFrxYorv4LULmDH//kLkxS73mWYLIoT5S1kND1LZMbuu2qXsCdxaFil88RPeSQwV7bpBvzJw5Jlz5yIwRN2j6hlQ+sZJomsnxLG9PMm7R8gctQZKy0UeA4mRtHCAvatxpfSVQuYNSCxmU2cgECkWe+ei27oihJTUTe8FoGQCUtGyedbkPZT2efWshSCWLTWI55ksrN6Ro2uEQa+KcOJse2QNqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G8z6rJJJx0UsCJ8DXyqAdsfBW1rzB+OzENAEairDrXA=;
 b=eJX2CBZtGbxIdORw+0DFNOjFlU76/xWC9Aii/oX4B16zttkzDt4DwvnlSw1hC0svjyeTvB3U+2kUZ601p+Lnv3wyN7iGLFY2B+mRBmBc5kKwxIQtEitv3Wxvo9hJUTsVnB/jAe7nzjgQEMxUXrTF4AsnPb51g79P2oOOEMLF5rfFmlVNFSkCPjvSgdTl35dQYeHeD1xEdQOZU2U6j+4TwKZIdFPwIusdYZJy6jkKTrHueIh7XVzEe04TxwSkJ/tA6hM14A0SyIDs8DLqqRqa8S11sbQ/A9a+Ye0iB7e74X0ZcImLNav28RvWjCnXHFPLrtLhI9ExpjWFsAVh/4N4qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8z6rJJJx0UsCJ8DXyqAdsfBW1rzB+OzENAEairDrXA=;
 b=EkwPjkB/1RXCJQVJUgcsVclxxHXQukdNMXYgrFHeqDF016XmCKrrNWaelYYsV6LLhPDwkishNSpR1i5YiODjylSGSQibNSmXvPyAuVBnQT3H2SUIB9QeEyK+Rw5OO/kPsn3lQbMzBP8CqouAVkGG2n0lWXsfSokaHCv26HIu/P0=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by LV8PR10MB7870.namprd10.prod.outlook.com (2603:10b6:408:1e8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Fri, 10 Oct
 2025 03:33:40 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 03:33:40 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] doc: Add rudimentary documentation for using [u]stack as a value
Date: Thu,  9 Oct 2025 23:33:37 -0400
Message-Id: <20251010033337.4397-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BN8PR07CA0033.namprd07.prod.outlook.com
 (2603:10b6:408:ac::46) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|LV8PR10MB7870:EE_
X-MS-Office365-Filtering-Correlation-Id: a870a54f-baf5-4494-1a6f-08de07adce13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4giCtkoG77O4nUKxYzKf23RPUlIF8LbcoSYTgq0f3eCcmzNcuc/8xgTFDgpW?=
 =?us-ascii?Q?1JyE3yu9BVuf5XruZMyx1VXQz4on6VWW7pTqct49+sXBAZj5dRF966WO9AZH?=
 =?us-ascii?Q?zLR2rDyEhHfJxfCZEq4kyY8oKpimFhNH+VaPXvGAbCaB5AqNDJcKXbspWJYF?=
 =?us-ascii?Q?+2TBYPswm1+XDTyzPkcwz/+s6odWjn7BKaBOpGyeWI3EM/HrHS7Skmy1Trjg?=
 =?us-ascii?Q?wmABaGnuBj0yLiznhJ/GTefP3GqIDzAe2w9PxccYFpVyI9Ca3JIrTHOWfoPr?=
 =?us-ascii?Q?aG1u/tNgwHgvq2biQf+cMuyBrNYhQYganFGnyRmyxxJCF+eh5UNLgX5AnGwn?=
 =?us-ascii?Q?NaaiC3Mix7bBqfpDwKOeHYZkmp6z+0I3XQwIn6xmHaqvWHNQwZVMCjTK3Z3m?=
 =?us-ascii?Q?Hi+t4dIomwXbCnaKmGSeg67Y1Gn9bZ9xlfWxmdCK4aie4BeIEkTUWhpc2GVO?=
 =?us-ascii?Q?whG+0rR6pSy+jpNlu09WHkx9zPBkwAUHJgzZ96fiK2vXXkpddMu45UeTVutK?=
 =?us-ascii?Q?qy/AYRZLnNpQ+gqnefAfFempBgyjPtxF33cdQUaJm3C7f8Kp/NYpaOXTLpcz?=
 =?us-ascii?Q?nIPRxRpT+oWKrkxZI7M1Bo91jHGwbFLH56LuarVzESBJwMdEwbVk8x5tQxmA?=
 =?us-ascii?Q?Re4siaabpVDwN8Lu3o0MCV6F//5YSos6TJ3Namz1qWF938jMaN3UhcJe70t5?=
 =?us-ascii?Q?5y5ESn3yUupWXdV7kWZvsXoAQA0JuQ4AWD8hMybfiBO8t+2rT29nbZJk/uIO?=
 =?us-ascii?Q?ReUqbeB7B5yQ8L/nsuIicTPqPkQJla0u3VKmkUppVSOObFiZsaWwA1xFD35r?=
 =?us-ascii?Q?dif9xNwTPQQ6n328Uadyw15spefwTogjTf0TIYtFGM7wpm1Gwo7C632ygMMY?=
 =?us-ascii?Q?8zIaBaWDDXewie8Gp/nkX2fBp++vlD6PUPSyfU1xt4kiYbLIQO7R0RHxY8kd?=
 =?us-ascii?Q?fApLf4DCmp4e11zfIdQcGhWbHBoFRqVv8g3LxWE3qoohpL4TBGpBrgSJcbl3?=
 =?us-ascii?Q?CdmtLsFZAFN43ZvsOftVT7q4QC6cSv7RRcmcXNHvDKKV2UJwC2Qj4vc01W/S?=
 =?us-ascii?Q?l62Yeyd0f6rqJ9M+xKigntW4CWHKaERK/lQyOkPPc+Ygz6b17rRYvJK5X+WT?=
 =?us-ascii?Q?FWvDMNhlqovob5MSt8ssc1Ma+sKlHytl1iaQGaq7mOaNRx97kmv6/tPXnODl?=
 =?us-ascii?Q?5pCw/XKazCWSlWaJIxeuHAmvXpAoteDGENCbHOa39luZDaMsoyFLI4xoWxhC?=
 =?us-ascii?Q?lm/kHZxU0LdUgfp8sniVlGvFxp6VYZno5f9TuIMpMXNXKbBX7q8BEATzBlH3?=
 =?us-ascii?Q?My7KWmeLBOj7qf4H7P4gFjFuTI/AJZlhu5U8Of7DESgOff24f/0xiZ6XNCFa?=
 =?us-ascii?Q?QE7mvH4diZNHcj/4hJ4way1Ya0JUzuxohnDxA5NjFvmHbS53bTBJkANYA9Hq?=
 =?us-ascii?Q?7o7h34prwJNehG5QaoyG48OTIrgExEYx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zZxT5i49LFzH7Mf5Ig9lSukPVdAJkxHQDDZaOpoHlDFSkZYmHaWZ9QfITAfS?=
 =?us-ascii?Q?kcg+W79m47CavCFMPp+pTM2Ot77WcMGdYiwYUEZ3ADua7oDFma4mLswhqSRO?=
 =?us-ascii?Q?W2IAdV8EoHPH0KINUJoiBXW9U6iaf4T8pY4zS3qM24g1ZYnIi+ZvfzbAPvPy?=
 =?us-ascii?Q?xn4vM9YgwwPWux6usl9xKSifgQEw5tytw6J/kVYYrMN7++aoFqDwUcKVVyhg?=
 =?us-ascii?Q?YtANGJGQDCbY9xTa92MOcLMrOq37oypkYap6dAD7PgzMQqppwWiZY6aigJzY?=
 =?us-ascii?Q?D/T7+mTcEvuEVVJl/S9nSgEwZMoEWVRY9VTY4Q0aQOhh77Lv3dkyoBvW9tVN?=
 =?us-ascii?Q?91AXiu+UzMQj9sACZvKimL9NtCYkscSBp8d1ykTMu/IB+9gIAudoElhWyXDn?=
 =?us-ascii?Q?JKzCCd1wQ3s6EUQfIImEPYnRHWERABNdpthEmhNRgUNe8TNLrqRG3cIog1NV?=
 =?us-ascii?Q?iEeze9fCAs5VXR+PmuLKDhSXl24q9FcPFxAUjTh+tTply+i7Wf7kf2SBtNlX?=
 =?us-ascii?Q?26wle16RXmlTvy9LtG5rsxHvO5huN5HIw7LSRO22PpRUVU+4P8odbIRoT0JB?=
 =?us-ascii?Q?qNjvuLpRtAkLP4SGSFD2BhYjZeuZ3SEwJK4hRCzUJERf9Y3L77zbdOQK79fO?=
 =?us-ascii?Q?HLX+88konYc3zwYte5VXEj3AARwsK6bYot42uRtwSVH4U/DONX5iFk8qtTJx?=
 =?us-ascii?Q?nZt4ijENdiGegkBkR+bqi58ldTo5ZSRR3br010TDhKaip3kL4RI8pCmd9Xy2?=
 =?us-ascii?Q?xzHBw7EXVBMPKJTJXhb6kWS/kBnxQJW7MRPmP4m/EXwOykkbDqpjR8zXV5qw?=
 =?us-ascii?Q?QrPVkpAy7u3MkRcwuBd5ELW9/P8+qBtcVpjfXFoIbzYOaslprM/W95OB6eCb?=
 =?us-ascii?Q?ta6qm0BBNUP2BnvRSIUBeOlvIxWu1Xs5na8OTUxNglw9de7LEgZyNROdibdO?=
 =?us-ascii?Q?FdWnkeDDB56bYAn1tF8LT1X/m6iOm1uNHZPBVW/gTbYStCmT9i63IQGUoxVC?=
 =?us-ascii?Q?3hN/UZ0iBtwSuxnuNyZkDcAvJpuWcsFLmHfu1LQm0jPQ3bw0G0NZ6IS/rS0S?=
 =?us-ascii?Q?4uLTDrUbupkPdTkK8d97Pw4XJFUQsn+CCVrTUh2hYGuKWrtEF8LF8impLX5D?=
 =?us-ascii?Q?v8LhAtVEmy0c9PdOxKyHtHSuC6wgHorLSvdXdHPYEa8VaYA1nMLl7EDUR6r9?=
 =?us-ascii?Q?IYgTw6qfi4hgChswYpSKrZyCtTUbKr2fy0sKts/sSQ5UyXnanoWHtZ2pNFch?=
 =?us-ascii?Q?ej3/LBd6Giz5HL2UY7zjlGem1DfA4KZgCFjTEKr+Vi04fn6hlVIgQU3VyyVs?=
 =?us-ascii?Q?2g0uflLr0RW8qLuvxXVh9tdBf5pXupTvjQ5CocPRBtsFaDcKalkSBDcHHswS?=
 =?us-ascii?Q?QCPe9OvOGVqrQPTx7xBjpa0Whuro31h9QmNN8LrIKaaU+7oy05AZCfBbGNMk?=
 =?us-ascii?Q?xIrisbBoLz6KzyfL2oaS+4a318USnBYhyIu7IWAeCSSOcfbJRci4n+Q7nKyF?=
 =?us-ascii?Q?Cvs1jMTo4PoYW3k7BFSL9SWJBOSDzFgoheEm5fG9AI9ASQTbiB1dfwV+YTlP?=
 =?us-ascii?Q?Nr2sy3CDOYMlWlSk3xDZ+mLqvtUyx/rN46mY/lED?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Z5j9jlaP4CWGrUoRD6GO1yESwvTDjEmLFVnTi861mVMHQmZ9ajJLoDCUf8QVcf30XNMwdEuH4poFjWybCSZ2RwMNjZtdCCLhM6TvM6hV48OAFbKo8eA9GmiVb2mYhRKJvvUZiBzZPAh4GfprhRNotjziie25ye38XW6fxgztJ3p4s8C6wPim9qflHqFaaYqIhMlibK/IjETHJJj/mD8eP3njwwWISNU1wRGtvmpELHcjveA9F1mDAI+soCC/CJbWBu+yoU5kn85mO0XAp1Bp7Ob+0/uqr1b5kIopwL8qORF3g1DRhkZwC6CFsH04LIbRdfjV4kGdaWZ0Pj1F3fno7gARjK6T7Qyp9KBLs2pDi2AjQ1Ov3a+lwfOhEyoVstIDYul10QBrIJaA2Sn6IF+o/wGTDfnYnFrLVHJ4t4+0ZCpFVD+zQiLgjg7fQrPlpnR1YgbRXeEgEbVaQaloknrDsrV/k3soGgF+eXsLcN6w9G7gbFEFRurysfdsDYMi7SNgyNIGRYIxdD152xouYPZETnBlVSlVG6DEpNFJJjuRFth/tdrN9pw+hLwcrtSFaFClHLZG1NakwxXJQA1r0tpncsx6lhXcbN1JoRyvEOkM0Uc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a870a54f-baf5-4494-1a6f-08de07adce13
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 03:33:40.3480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5abw6VaFdK3yRx3DRBv/BuehnXwdCM0Y8+GY7A0Q/7z8r2TPWYHpT9eq3Sqnjg9oiQli6amdHR7Oea2za9ySPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7870
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 phishscore=0 spamscore=0 bulkscore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510100019
X-Proofpoint-GUID: Jmml6QaKqOrv75s7XYrFMy93i7SK5-QF
X-Authority-Analysis: v=2.4 cv=Nb7rFmD4 c=1 sm=1 tr=0 ts=68e87e9f b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=EYJ-NVRaNnPYXzG6zEcA:9
X-Proofpoint-ORIG-GUID: Jmml6QaKqOrv75s7XYrFMy93i7SK5-QF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXzjpOakEJNY2V
 SZLiaTUEnfVX1WqvnzCnnDxCYF0I7gXWibWMlULig7sZl+qTsJd63uAKEdx+vQ+EUb1eWUl/rlN
 8vKzSvGpEJwNEdOgFTItSEQQb59PfgG8zC3wJRhkom4EZ6FUpQG1iuplJJfSQQPu8iFa8y6ZBFF
 u+QkAHzXLF0F4KhdQFw12y6MdMBMLukg3J9E+HW8XBq3DT6HwZFc0tCmTXO/HdvKjH3cbvSMzUk
 Pi2X8Hf57QpRwvarHp8DQLZww+5cZytml6/akfnrN6reoz/qYGMZqiYO4Vf+GxQYHAi4gja3OFV
 XhXfxWN9cRNFCEWIhalwlnUHiCGmhBznuS1c0Ba65P/kzrSq3UAzknP8JmTXJVaPEY4TOG0Y2bu
 lSrNt3huZWuufvj0gOkFpklXkT2AVA==

From: Eugene Loh <eugene.loh@oracle.com>

While we are at it, break up some of the super long source lines for
future maintainability of these files.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 doc/userguide/reference/function_stack.md  | 21 ++++++++++++++---
 doc/userguide/reference/function_ustack.md | 27 +++++++++++++++++++---
 2 files changed, 42 insertions(+), 6 deletions(-)

diff --git a/doc/userguide/reference/function_stack.md b/doc/userguide/reference/function_stack.md
index a92c61a0f..d172dd017 100644
--- a/doc/userguide/reference/function_stack.md
+++ b/doc/userguide/reference/function_stack.md
@@ -2,17 +2,25 @@
 # stack
 
 Records a stack trace to the buffer.
+Alternatively, returns a `dt_stack_t` value that can be stored in a variable.
 
 ```
-stack stack([uint32_t *frames*])
+dt_stack_t stack([uint32_t *frames*])
 ```
 
-The `stack` function records a kernel stack trace to the directed buffer. The function includes an option to specify the number of frames deep to record from the kernel stack. If no value is specified, the number of stack frames recorded is the number that's specified by the `stackframes` runtime option. The `dtrace` command reports frames, either up to the root frame or until the specified limit has been reached, whichever comes first.
+The `stack` function records a kernel stack trace to the directed buffer.
+The function includes an option to specify the number of frames deep to record from the kernel stack.
+If no value is specified, the number of stack frames recorded is the number that's specified by the `stackframes` runtime option.
+The `dtrace` command reports frames, either up to the root frame or until the specified limit has been reached, whichever comes first.
 
-The `stack` function, having a non-`void` return value, can also be used as the key to an aggregation.
+The `stack` function can also be used as the key to an aggregation.
+
+Or, its value may be used as a value to a variable.
 
 ## How to use stack to obtain a kernel stack trace for a particular probe
 
+In this example, `stack()` is an action that prints the kernel stack.
+
 ```
 fbt::ksys_write:entry
 {
@@ -22,5 +30,12 @@ fbt::ksys_write:entry
 
 ```
 
+Alternatively, here `stack()` is used to assign to a variable and print later using `%k` conversion.
+
+```
+        v = stack(3);
+        printf("%k", v);
+```
+
 **Parent topic:**[DTrace Function Reference](../reference/dtrace_functions.md)
 
diff --git a/doc/userguide/reference/function_ustack.md b/doc/userguide/reference/function_ustack.md
index be9436f82..01d282c7f 100644
--- a/doc/userguide/reference/function_ustack.md
+++ b/doc/userguide/reference/function_ustack.md
@@ -2,14 +2,29 @@
 # ustack
 
 Records a user stack trace to the directed buffer.
+Alternatively, returns a `dt_stack_t` value that can be stored in a variable.
 
 ```
-stack ustack([uint32_t *nframes*, uint32_t *strsize*])
+dt_stack_t ustack([uint32_t *nframes*, uint32_t *strsize*])
 ```
 
-The `ustack` function records a user stack trace to the directed buffer. The user stack is, at most, *nframes* in depth. If *nframes* isn't specified, the number of stack frames recorded is the number specified by the `ustackframes` option. While `ustack` can determine the address of the calling frames when the probe fires, the stack frames aren't translated into symbols until the `ustack` function is processed at user level by the DTrace utility. If *strsize* is specified and is non zero, `ustack` allocates the specified amount of string space and then uses it to perform address-to-symbol translation directly from the kernel. Such direct user symbol translation is used only with stacktrace helpers that support this usage with DTrace. If such frames can't be translated, the frames appear only as hexadecimal addresses.
+The `ustack` function records a user stack trace to the directed buffer.
+The user stack is, at most, *nframes* in depth.
+If *nframes* isn't specified, the number of stack frames recorded is the number specified by the `ustackframes` option.
+While `ustack` can determine the address of the calling frames when the probe fires,
+the stack frames aren't translated into symbols until the `ustack` function is processed at user level by the DTrace utility.
+If *strsize* is specified and is non zero,
+`ustack` allocates the specified amount of string space and then uses it to perform address-to-symbol translation directly from the kernel.
+Such direct user symbol translation is used only with stacktrace helpers that support this usage with DTrace.
+If such frames can't be translated, the frames appear only as hexadecimal addresses.
 
-The `ustack` symbol translation occurs after the stack data is recorded. Therefore, the corresponding user process might exit before symbol translation can be performed, making stack frame translation impossible. If the user process exits before symbol translation is performed, `dtrace` outputs a warning message, followed by the hexadecimal stack frames.
+The `ustack` symbol translation occurs after the stack data is recorded.
+Therefore, the corresponding user process might exit before symbol translation can be performed, making stack frame translation impossible.
+If the user process exits before symbol translation is performed, `dtrace` outputs a warning message, followed by the hexadecimal stack frames.
+
+The `ustack` function can also be used as the key to an aggregation.
+
+Or, its value may be used as a value to a variable.
 
 ## How to use ustack to trace a stack with no address-to-symbol translation
 
@@ -35,7 +50,13 @@ Mon 20 Feb 17:38:15 GMT 2023
               0x7f6d63fc2e65
 ```
 
+This example shows a D clause that stores the user stack to a global variable,
+then later print it with a `%k` conversion:
 
+```
+        v = ustack(3);
+        printf("%k", v);
+```
 
 **Parent topic:**[DTrace Function Reference](../reference/dtrace_functions.md)
 
-- 
2.47.3

