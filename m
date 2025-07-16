Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7960126281
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 04:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752641130; cv=fail; b=MDSmqIVchYPw7N2fe+hSHte4MGVXW3LFFqoeIuhym0IDk7hdiIaixQ/c6HrA1KTx35JVjDsLveKR3eUOhEN+Pn6YdOv3vAjBtWpe5i1str+MXAH0UfDtRHHIDo5ZB4m9aky3MEDV5HICi1bSHO8zY+7obZPG/f4kvktXX1lLn5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752641130; c=relaxed/simple;
	bh=smOI/GECHoEfpnQmbnadEPNpm8rnEa3m5YI5SFQpue4=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OjtdaP4RFF+5MyOy+PGEPHHZS5yrhaWtYgCzzBsCN7tZfs4dCsA4Jz94HLUmCZLCKNy2XTaqLKT1gyDImmJu1wRYmYQMMqo5NVWLfQbBQWq690aTFqYuCJdkXQj/cp7inTwxixZInJFdeg6obapORWOYV7u1m+3mfpmtCVSsGPo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Z0ih+CaP; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=u3/gtAx+; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Z0ih+CaP";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="u3/gtAx+"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G4CqVR027257
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 04:45:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=8idVgUMfZ7MnHmXyjCAP5gOlneONzJ7ECpF1WXx/Ng4=; b=
	Z0ih+CaPL4zeH+jzC8R2NcxcJLA3uGpJjP6MOQNgiypljrDmI0QnfL65dZVyvMfX
	X1Bff/nv1e6nQ3qGSbSw4KLanLBKH+BjqQyKME1t7oQi3Mi2ydulKBLIr+CjxXf0
	2DI82XQZwOnPqqMfl7uPVfw0FEFLMP8lNWenE5KF3oAreiIcYOf2DB1dJI5hci3t
	sHBCQjSFWja+ixEeIRLJkk8sneMM5ZKWz9T6qf7RP1v0DHFoaERup+Q7q3y89GR5
	TUW0MNr1b1T6bJhZAiJfjMNriQWkz+JJsoPEXL3HskEbNkgqjlhi4H7EYM68Rm6n
	kaZifYRQCrCQKoxqMPrRcA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47uhjf8kv1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 04:45:26 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56G43NjU040497
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 04:45:26 GMT
Received: from cy4pr02cu008.outbound.protection.outlook.com (mail-westcentralusazon11011043.outbound.protection.outlook.com [40.93.199.43])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ue5avj7b-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 04:45:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ezL03Ty2n5eMFvvPWkjIi9klxFrBpw/aJcRjwBbXgNXJvkw5kzOSEIK5uvNmticEAxSYfqVPRhMQWLmNLAY7Vp9vmwBrns1r3xXyzbC7V2ivSN5yWz/O77BkYDNySVOQImyXeep1c3BPXSETHFktqRjdi16UnnFb1AMjpp5dXOdifSOj76xC+3vpKlmnYYuZdMQ+lVPVCxvGEEcqzoPtxGl4Pth4fOUvV8jo4qOGbUb3NV3Xb1+aZAi+9dLDMo6Kkk+A7366VTvBYbi4TTc2HGFg31c3ifgC9rKH5JRD8bxL7oR+C01toUtM7paGSwOsJ1oLtBICsdqQfx56u7MysA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8idVgUMfZ7MnHmXyjCAP5gOlneONzJ7ECpF1WXx/Ng4=;
 b=l40l07WnpSFfTBCRVRM0Tmw7wgoLovcA8GrhREGmTEDpypRqd3SEgrEYahlc4PCVrvk0hQ35ykY418dyG+gx52xhrCs7fZ/BfKjZXZBO3XHbebYs/nUSEE0QyX3C9E9woOVz1EO6RnlNZ6QFjP/LLT65bV2zlAWAiFflZ87diwwQmuxiB/HDMOTaxdGk6ibm1R5KLmX4tLBgIqQUYcIlbFGl1w9na6Qxk3NF+LWpPRFumKrXO+emcrQOrja9GFGuHoBFi4BXgywhksfAuGf1v9nRcB2xOdwBoBNmzqTTHjJjdDRm1cjA3Z1BPzFdOidBhdOMScg6L9lV4ouWDUt0nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8idVgUMfZ7MnHmXyjCAP5gOlneONzJ7ECpF1WXx/Ng4=;
 b=u3/gtAx+QjmZRpnPXcD46h1sICJzr0WRe3blZ7nf89xPMbqzKFtla7Vf/wwz0JNg7Nb8agOsQGbPq5OdGTfhXIWNWxK5a7II5OrCF/DXZJ/bB0n8Axd+n14JkPRNaRViY1W0369zF6sixK8RUktuceGK4U1OKsvpaN4rZgMjODQ=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by MN2PR10MB4157.namprd10.prod.outlook.com (2603:10b6:208:1dc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Wed, 16 Jul
 2025 04:45:23 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%5]) with mapi id 15.20.8922.028; Wed, 16 Jul 2025
 04:45:23 +0000
Message-ID: <2032c9f8-aaa5-91ad-64ef-53ba665613b6@oracle.com>
Date: Wed, 16 Jul 2025 00:45:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/3] cg: validate tstring alloc/free
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB567277E28590C437C8E1955FC257A@SJ0PR10MB5672.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB567277E28590C437C8E1955FC257A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM8P191CA0029.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::34) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|MN2PR10MB4157:EE_
X-MS-Office365-Filtering-Correlation-Id: 28494c4a-83b8-4bb9-f535-08ddc423933e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VDNXZnJJalF0enBoZi9uU0tzajZjZUtZS2cxYWRKcXJIU2lrV2NvRHZNRWlO?=
 =?utf-8?B?VEwxTGR4KzR5NUxvbEptVlh6UVV2VU1YbFJWcmNrTHIvM004RFcvVlhxWmtF?=
 =?utf-8?B?Q2xtOEtaUm16eUsrMlBKT2xJcjg2OGtENlU1d2VWcmtxSG42M2YycU93TEE5?=
 =?utf-8?B?OVNVTDhUWmowdkxmOUQvN1RKODdqNjJaN1RaaEtLd2lPZG9Ea1FOc3Fsc2E1?=
 =?utf-8?B?MXZzTHRUYVpRNFMvcGVsQ09MQ1JOT2kwZnFYTWc5VmhtMWxzZnNDZUVCenJC?=
 =?utf-8?B?YlhrcHJsUlpheFR2SE9DbTh1WE5CQ0tRTXFJYVRiQnN2bEtyckZtRGRDNjZG?=
 =?utf-8?B?b1hML2lBUVhycDQ0RENBcmhUV3dWZ3k2b3kvUUh6bEJXVEZmeDBuMTJidkRB?=
 =?utf-8?B?RW0yb1ptUm0zd3E4RGVxTVUvSk9Ob2JzdTFpaWVRQ216ejlrc0VuMXJBcDZG?=
 =?utf-8?B?NUFKQzZhRWg1dnBNRjlmcit4a0dJVmNZTU9vRnpFVlA2U0FxMzJ2MXo0TndL?=
 =?utf-8?B?TGprRkh2d0YvVUl5M1RBQnlJWFdyUFZ5MG1hWG1iaTQ4bFd2NXdHU2FFN2Nl?=
 =?utf-8?B?REhlVTVNQkxZZkNaUXVSYUpqLzZCMjdtUCtPVVZhWWFxMkRnTkVYejI0d1Z1?=
 =?utf-8?B?TTdXcHNhdVRDZEhXRVFTWDB0c0F1ZzV3dmxNRWZNQ2xvOUcrMldKc0pCMXBM?=
 =?utf-8?B?dmdoQmE1a0ZHWlVyWkY0N1RyWWJtN0hNMXlkMzZOb0swNlFkK1VSb0JlNXpR?=
 =?utf-8?B?OXVjUkhXS2l2czFtengySElaZ1JIRnpjL1RFczZWYVM3YmF2cCt6bmRDTGVK?=
 =?utf-8?B?b0dvU0laVFB0VFk0cFNqYWs0U1JnOGRSMEZZUnY2VmxYR2FBZ1ZwQjQxSHFj?=
 =?utf-8?B?blp3NGM5Z2RBdUNrYlJrbURCTmxLSHlTYlNxYVJuVlBleWk1Wm1tbGJMYWhx?=
 =?utf-8?B?ckRybS9uN3J1UTdwSDNxekhGaHVjcDJoU0V0dWs0YUFYWXJqdXRicUsvR08r?=
 =?utf-8?B?RW9sbE5FOUlRSC9udTRzb2RpcHlKdFVjaVVRZDNOY3BxalpvVlhqQ2ZqQ3Yw?=
 =?utf-8?B?c2o5NnowdzAxVzUxYTBqSXNEVDRja0U0dlFJbkZUTFZnRFJ5dWd5blZtRWtR?=
 =?utf-8?B?R0lNUFRnaXkwZU0wR0lVT3NZejFtQTdLbzRRWTd2cmZCYUZRMzA5blRoZ2ww?=
 =?utf-8?B?NWoweXd1SDlPQ09PVkcvNjNPNkQ2cUNqSEhROS9BVW1FeDRZUHFQOGd2UVhI?=
 =?utf-8?B?a3h2OXZVbFNFZytIem9PRzJoaTdrOExzQUpDRkU4ZWhxbXNkMTFuaWdFdEQ3?=
 =?utf-8?B?UWpPdHJITUkxRFhVYnVJeUtlOU1zbmVxTWJuQXB4b3JoL2g0ZThyOHlsRnJJ?=
 =?utf-8?B?cS9JL2oyT0k5Y1pnSmcvdmlCandRWmw2TzJjRG54OGxsU29hN2hIWFZNaUN3?=
 =?utf-8?B?cVJ3cFlEQmIxYmlBeFFkcWY0ZWFVMmhsLytnQzFZM0l6cFNERGhrdnplUEl1?=
 =?utf-8?B?R242S0NhUkNKdW95TkhOMVNkQlhlZXdMTXlxL0NvbVVWeFhJc2Z2K3pLeGEy?=
 =?utf-8?B?TXFtVnRWOE5yNE1FZTNxNFVLdlRIaTlyQTl5bTdhOVBPOENRWW9MUmwxUk11?=
 =?utf-8?B?ZGJVcXZDa0p6OGFpS3NLM0dITjJYbWFrdGlDa2dTSSs5TzdERDhvNWNiN09h?=
 =?utf-8?B?enZPRGh1eHdsTE84MGFYUHF0MGY1bmFNWFZmUk1YZWowaEFNVXlNNWlqNUhs?=
 =?utf-8?B?cUl3L3Y4d3hRUjlHVWRxRGQwRXA4aWRUdTlqblNld2ttYmNqdWtwWllrWmdk?=
 =?utf-8?B?Qzc1bmZIR1FPb3laVVdVU2pla1l4TGNCTTVOK0l1VjN5cHRmd1hycDJBbjRH?=
 =?utf-8?B?T1dXTFZ4M2RQblJBcFloSUxqZm1kam1nWExoajZiVmFXYlE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDYweGlOOGJacjBIeWtLdW80R2RUeWI2elhGOXZpdlJuWm9EbHZDaTlyUVF2?=
 =?utf-8?B?RjV2K0txSHZITWhKcTU4MEdDSlFCSDVJMWJURkJRbklvMzdSUkJVY1pZQU5a?=
 =?utf-8?B?czRYem9OVUZuT1cyV0hmT1ZBZHJqUDFEcFFtODVJcEZ6WU9CK2JZV28xeDM1?=
 =?utf-8?B?a2VtZHZSdkw2TjRFOEtEbkhmVnNWVmNKNXF2cWx2S25Na3M1MkFEUVkybzhl?=
 =?utf-8?B?clJ5N000Mm9NdDJJKzJvVzg2clV1K1RVR2ZOVDA0d3ljUncrZlBnYVl6ZTlV?=
 =?utf-8?B?ekQvL1Z1Q1NVUkhkZHlqNGhBZFNzQ0IyMTc3RFZHZkltYkJDZTh6aHR4R0ty?=
 =?utf-8?B?L2RrRXpyMTJjd1NDZjU1bE5JYTVIQTMrcFpXQUFkOUFQNGxRTU5GdlRlWkM5?=
 =?utf-8?B?OWtYY2xxZ0NWeHQ2OUpXQ3FKUngxWWFhR2NyN0ZPNUdVaVEvbjJXTmFZSWNJ?=
 =?utf-8?B?WEwwZUNCKzZ5cmZ1Ums4azl1QkFMb0J6S3RielhJTmhrTHlqU3pydUpQNVkz?=
 =?utf-8?B?S0J6ZjdIVVRON041NGdRU0p0aXJ2K01VZnB4MXhJK2tSUzZyZ3hMNy92RDBr?=
 =?utf-8?B?SERSTEU3TWY2K1I2MXJZWFJwbnRyOWROUVhvclRtSklTeWttS2FkNVAwNVdO?=
 =?utf-8?B?L2dCUTVoRWpKYVUxNlRIQU9tWmJFS1UyV2VUTlQzalNjTFdLelVBbkswRjAr?=
 =?utf-8?B?aHc5emlQN045VUlVVkk1aHhmYmtOaDlWT2lVaEdidGE2MWpBRW5OVEpQcjR1?=
 =?utf-8?B?UnU0U2ZmMnBMV2hjYUFLRS9ScEIzOXZzd0JValBxOVRrUGZNZ2tjMUpYMEVG?=
 =?utf-8?B?YllKdEFQRlE3SmRPSGJhWUpENFpYd05KWHFFS2gwbWEvd0g3L0hLa0tOMmQ1?=
 =?utf-8?B?c09jQnlOdmdQMHN1a3Y2b1pSL051UStIWGNzWVpwcWxPMHNmdnM5ZFZMSXZH?=
 =?utf-8?B?MWdjWFlBdDcyMnI1MlY2M1BjN0VlcHB6NkR6M3RkT09FRzNSNnRQNVFtNGNZ?=
 =?utf-8?B?ZGFGRnZSczBXODR6UjEzSVd4aWRjZWpLRXZjVTFQWGs5UnlYaStQbjNJVWhO?=
 =?utf-8?B?YndaMTNjazc0VmZkdTF1ZmFaRDFjeCtBckxFbDBEV1kxUzRjaGl4TTMxTmxk?=
 =?utf-8?B?cHJjczM2djFKVnNUMWsrK1h3b0VQWUFIV3hsK21YcFgxL1ZSTnVuazg4RWRC?=
 =?utf-8?B?bHdhWUo5enMwTzFneGhlL3daQlp6aFZKSDYwQWNGUHFWbjZiNFBxNmRqUzla?=
 =?utf-8?B?SmM4aU1iekI1U01JN0Flditkek5VZENvZzI1TkhUUkI0bkZkZllYWUFmYkdZ?=
 =?utf-8?B?VGFVb1FuMjFVbWNFeXd3UGNodm9hUHZYM2NsRVE5bnpwYTdCb3V5U2NUWXpJ?=
 =?utf-8?B?NzVPeWRkMmhpZVpDVjVSQWY1UlNwa3RHbXpCOWgrSTBYQmU5WDlPVDArZFAr?=
 =?utf-8?B?NFJaUms1dVU4YklncDJ2MVN3MGQzbTduTVl5ZndqR1RqVzZVcWovTFVURGp0?=
 =?utf-8?B?VVB5aTBFbDgxc2I3K3RhZkZ1MjRaOXdheFMyM2Jyb1FGNWkzbWpwQkNiTGR1?=
 =?utf-8?B?enZVS0lGWnNyQXpTd09FNEw5Q2FhLy9CTDd5VXZkYThrTEZiMXVNWjN5TXFs?=
 =?utf-8?B?cFhoRmRmazRtRExqRDhtRGkxVWxzTjZud2YzbW9uZWxYdmNSRk04citWTTBJ?=
 =?utf-8?B?cDFad0lNeklRanNVanNwS2h4MCtlVDcxaWUrWHdpaHM5Wnk3amZWb1U2eGxR?=
 =?utf-8?B?UC9UbkJjUGt4dmRKYUwyNHJ2MGh2YVJOVmFhelhGTXBjZW5va2tuNWNjVko0?=
 =?utf-8?B?N3NnZGZFeDJFOFNrc1JwUG5wczE5WGlERkEzSzBDdTFvckhZditwNm5LNSsx?=
 =?utf-8?B?anhTcW1CL2NyR1U4M2lNdUdRcStpQTBlellLaHhVTE5mcVR5TDlGV2VSTTdN?=
 =?utf-8?B?L0pNTElvdDVqQnFXK3ExbnJjODlMdjdRU0N4Umhid3dzeXlISlkrZE9LQXdT?=
 =?utf-8?B?dWU5Z2Y1a0M4bUt4c2ZZT3ZUbHN5Q0FILzd6d3RuM1Z5MmFMNk9zazFlUFdD?=
 =?utf-8?B?SFlvdHZ6Ti9INDRwbnFkeldVVjUzaFRHL2ZMMFZPb3d4aCtSWU04Nm1pcE1V?=
 =?utf-8?Q?L4jO+QNv3oDXzmRm/Vd2GXbQO?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kL+v1dEyarIQn3CvJabJbqjMU64RfBG6OD6LgkEamzC55bjslyiHNomvvr4q3XxGnl8/vcLdlqD0BLuY3pYaFw5ElwkMGpbSJRwmBoVOr4GjoZj9kHlF9/ANigjTDBspnzWPJZKQFyYGlePDH6sULLWxQ9BXvdoFODob9LnUAzIhraF1Iueo0Rh2+JeOsE66tMicoeWNCWMqpL8Yf6mwF6EavTInCL07qrJMthkd4Jz29wXfxSFlCGILWS+zx5B7CtC+gZgMQr/YY2ZYTrHdsImSOlUFZwxhi6RtKhh+v3AFkXcAT+XkpDCw1nUt+/MmvtncWhi1qEJgkGe49jGGdXi1lF1CUlipKZxJpzIRBbTB/4oSpYWigB0dShUiMkV8EfA5pPNoetPh+CMNBNCmf8U3Gf+WqpOIwy09+l4Gvdd8JhSY2q+/0su2++nKSWb7sQra0CNQx/Zrz2qKILaQEGImTO63OXREKWSGG7ntzt/2RtxNymyXCVrvcPtPao9Cf/6xcff6Wlekg2U/4izPK5J+hsXXsR0rrWTi3byOT6MEZOpdNWFozqjFFiPQVcI2yV8foXP8zVKvHgyWMwezsNXgAwb0a4qsO+n53YNULFE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28494c4a-83b8-4bb9-f535-08ddc423933e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 04:45:23.2198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FeqA4qW5qEMQ7taUJZ7DQyiZTF3DjWgWBVpYXMTKhF56DpN/4xTGCFMb+7+BebV+Mh7au+QACbqsX0fwE8aQ8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4157
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 adultscore=0
 spamscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507160039
X-Proofpoint-GUID: N-dX6PGwegLjkIJOGZb-DufXkSADiX0X
X-Authority-Analysis: v=2.4 cv=O6g5vA9W c=1 sm=1 tr=0 ts=68772e67 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=2gQHVe4u7Zh6Yz3yt80A:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13600
X-Proofpoint-ORIG-GUID: N-dX6PGwegLjkIJOGZb-DufXkSADiX0X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDAzOSBTYWx0ZWRfX82Xom52qaIBm mjXVeeeDF1XgC6evYtTAFtVgVK1vB6QBzZ4ReM6fMQFW5jGBYFXiH4fMsuhqPdFRF5vygzgGu4f f+8jJ2qiYac8JGBcWOkrHxHwSxbrZzkGM5+DmR3XyyH5xZPcWwp2HCZYX4RnxL19xXZAlhEk9/h
 lCqvdn4LVhfC2sCJdqbK3UnRQEacqkGh3I/nV4kdKYoovZe01cjIaLkZFOzSavIR9HhWlMiQSj7 qv6JpR29IlXMO497wwyGzKndUfR1FiRr0VirkaU2pFtIUtJ8MYGgKbQZ6FfWQ7uHV7gbsXtU9ZK EVajhtTX9/oM1xQUj42c7ezg56E5Q2iVH3FxReEa2zAffppSNqdda6OByVF3XImqIZaPSc3BbDF
 U6BOz9UmdlzT4QGsgSM3o/J8l6VdgAO1qZ3yjCPWuP9KBQt/0ZvaUkwn+a/PWW5EJ/CtBikd

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
though apparently
undiscriminantly ->
indiscriminately

On 7/15/25 15:50, Kris Van Hees wrote:
> Rather than undiscriminantly resetting tstring allocations at the
> beginning of a compilation, actually verify that alloc/free of
> tstrings is done correctly, i.e. that none are left allocated after
> compilation is done.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_cg.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index bd0763d6..6c7ad076 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -1432,11 +1432,12 @@ dt_cg_tstring_reset(dtrace_hdl_t *dtp)
>   		ts = dtp->dt_tstrings;
>   		for (i = 0; i < DT_TSTRING_SLOTS; i++, ts++)
>   			ts->offset = i * size;
> +	} else {
> +		/* Ensure that all allocated tstrings were freed correctly. */
> +		ts = dtp->dt_tstrings;
> +		for (i = 0; i < DT_TSTRING_SLOTS; i++, ts++)
> +			assert(ts->in_use == 0);
>   	}
> -
> -	ts = dtp->dt_tstrings;
> -	for (i = 0; i < DT_TSTRING_SLOTS; i++, ts++)
> -		ts->in_use = 0;
>   }
>   
>   /*
