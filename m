Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0976F101E2
	for <dtrace@lists.linux.dev>; Thu, 23 May 2024 21:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716500514; cv=fail; b=KbrLbra9nkFs1KAN6f1f/gVIZ2geK/9fJCVlInM5x6LeDOaWyreNmhNiCWyasz987R0MRsCt+klabpXbvALUSLBZOI2fw2OFTquAFt6MJEw8UU5rKtXQkrA2xl6Td5ZkirTmngmZPGJJQ5JZ8q2ETr+O/iyhJoNqPRsmhcukbt0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716500514; c=relaxed/simple;
	bh=5Jg1q1f932er7dPSnRRmBLb1K+bd+V9XVLQHZc2BJZk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fxCfEomfNOl/LLB7gCA6edCuP7z19zKPTRyVE0L97fzWdhcnUWcdv8uy9qI02B8W8rs4gw0tXSIXyAXvyuqN+POMyICOHTb5i/KWmOBx62Q1FiyiVDkPoRR93XZQ789iT2bn4Ii2fAo+pXqb1jh2O4rxjDFQ2i/f6O92rdpvmMg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TbOrwFw1; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=GNZcHPDY; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TbOrwFw1";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="GNZcHPDY"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44NIweZV025306
	for <dtrace@lists.linux.dev>; Thu, 23 May 2024 21:41:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : subject :
 date : message-id : in-reply-to : references : content-transfer-encoding :
 content-type : mime-version; s=corp-2023-11-20;
 bh=rO71hJH8aqwHvydfw+AW1CdfyYtZEWP8sxmhlVfc/fw=;
 b=TbOrwFw1Jj4BOfri6gRD9w2rKMG8Bx+Az6iAQ3vqM1UyceghrXpVY5gSlAmZiWXC7aQA
 yb8JpTYRRYb7jVyI7hlmCdu/RdfKLwtWw3xUrwxVMqJ6eXPeGzFndGWeV0jjpaCi+a+2
 fRcj5NYXIQAYsXrJXSP0OFI/XEaATFonaCoqHjL7jtVkV5ZLn2Su5q1Y4y3nPbJpaEIy
 4FnvY33TVlPWsQwirNOiNDZOkDKpUTCahPPW4saDPx3jnpa3mMtMmbsxzRzvaOhKdvOC
 zXaCv08gyiwl/Vxr9n13ka0xw78Dkr3G9AlqznuKZRKULdQ3ct/hbY3M+wynLjxdUvha dw== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3y6mce3bc6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 23 May 2024 21:41:50 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 44NKKaDu013845
	for <dtrace@lists.linux.dev>; Thu, 23 May 2024 21:41:49 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3y6jsak90m-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 23 May 2024 21:41:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FfeoamEpmr7MqA6Rakj667Xz2xgNNrNlPjN5ltAt+dQyq6zenE62wu0DTMdL4S3/W6Z+6MOzT7zXlqc66TdrKr12vdCoQMha3T5qwBqxNOy7/Z2zZBztN55UKtlQWGDUNMAquRYKK3671CUYDP63xNAV/od77NDoFVKPqljlkfzlQDQ6/0XVgsU/HJKz7sxc6sGNG71MOZ4zI2q0ewdMzQrc4lysjL4Mw1tvsG9if5N2rfIEr+XrVzzkWOO2RGLrG5c3eKN1gPK/pCnm14HfP4c6G+hofyekSbkkPxsSlib5GDMW9PvUARevFEchOuX8CGver7KCO8JuwKP6H1fDHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rO71hJH8aqwHvydfw+AW1CdfyYtZEWP8sxmhlVfc/fw=;
 b=kyJgoQcgbD/16QDFV0z7q/zLdghYT8Uegh/b0hM9OXxRVzlRPewxdB+68tPrgw7BLpggTXtbL4ai2/UFL4quwv5Gv9MX9yrbdCLJNV+mjes9tqS56/kI7QKXX477Bs/KtwYXhDvGBhgC5FfpgLqKs2wn8ea+4IPgKN2VD75Su2Aj4EcsvIa0bBgvwjzCVl9g0z0RCoJLEgBANpdqe4xKbjqpYEBxnMhSvRpsNPZkgBPOoI+GikiPzqUEPAnAzt/tKyBFQujzMMBO46Y/J82zZkF8X+2R13nnel9THxQH/Vk/L2htM4bUbImq+5Rqvaqrukch23mjv0uQhe8AgFEfxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rO71hJH8aqwHvydfw+AW1CdfyYtZEWP8sxmhlVfc/fw=;
 b=GNZcHPDYhZaFMA2K5FB4K5idwrERdY/juGOEVlsyK8SHZ9035+K+5DreIAjAsmXyHhzo92IoHEHs5v1grPG+pBHg25t85BQ6rou1nsGbvrCxwbw5EfEukiky+xkJjt7HNtjolfCaRBxUZAzRT9dR6tJ0ak4w7FWvhMvjAz33AlQ=
Received: from MW4PR10MB6608.namprd10.prod.outlook.com (2603:10b6:303:22e::8)
 by IA1PR10MB7334.namprd10.prod.outlook.com (2603:10b6:208:3fc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Thu, 23 May
 2024 21:41:46 +0000
Received: from MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df]) by MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df%5]) with mapi id 15.20.7611.016; Thu, 23 May 2024
 21:41:46 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 2/2] build: initial pkg-config support
Date: Thu, 23 May 2024 22:41:33 +0100
Message-ID: <20240523214133.500082-2-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.45.1.275.g567cb0950c
In-Reply-To: <20240523214133.500082-1-nick.alcock@oracle.com>
References: <20240523214133.500082-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0495.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::14) To MW4PR10MB6608.namprd10.prod.outlook.com
 (2603:10b6:303:22e::8)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6608:EE_|IA1PR10MB7334:EE_
X-MS-Office365-Filtering-Correlation-Id: d4282fa2-0995-4367-3366-08dc7b71254e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?qEaqcLPPI788Dss8/sHMjSmI0RzZ75BZ1C5jtGae6HmETje3PG1BA8/MA3rY?=
 =?us-ascii?Q?0lS8DrRqcVLqBwP5wLbL8z5V+pnscIF/0sLo5McgTjcMoVK8U5ClFRYs7n0L?=
 =?us-ascii?Q?lEAkRWH1LUNYEw/NVmjHgzrwZlU7IYtNDTPKFGRvwcQuoJcu00OCnuJy3/jQ?=
 =?us-ascii?Q?AatgGJwuA7N41FnQ5c3IjUuK6ERFSPYS5D5H9gqjIu6K+hmL0dZLCN+Wec48?=
 =?us-ascii?Q?RR6I+BY9jPBzEfxzZwfoznwLodqXzD1DMThAc+rQxvIYeNkDFt/MdXZDEVAw?=
 =?us-ascii?Q?Gs2XDjgpvUzkmyWxh2TcEHs25ZoIZ2y7h45biKUWxaJMC5AewlLWf23VP9sB?=
 =?us-ascii?Q?es2oKDDGatKYSO82CPGEAJCX+8Orm4bdo79f7M4ZluDF9B+RGbWCblh1owl1?=
 =?us-ascii?Q?aVnbDdiArwoP6EkxOImepaE8/QtHG8OAsWysOKihR3BpQTlVjm10PqE0P3wZ?=
 =?us-ascii?Q?SCldl1CSxTRW0w8vivweXq1/QFNCWpUJex6VCc9rOq5wAHfnb7EYTCDP/JT6?=
 =?us-ascii?Q?KZ+H1PuZzhkcPQjSNOxdIwCAdfACM/uW3Z4DbnQVgVheSHD+47tw/kItaFEh?=
 =?us-ascii?Q?T2p6CzExuTPznJqAsA0tfMHRXxFaHaVYgmKXYiOrcapJ8r7NGFk5ZAO9V/Kt?=
 =?us-ascii?Q?jdPu/d8IKA4yb0c135ydW+dQK/F3uVy8ecP+JFCHjlqWGf87hxaGmQqPDcKx?=
 =?us-ascii?Q?w9YoNjPLjl/AsUUHoktOqqEkRPQwoBSyKT73C61PvLwHYADStbaD/5kJUaS0?=
 =?us-ascii?Q?4nBsncRQVVDM2ALiaEEXwpaNeeOYWrpooRUQkk7NaqE5Y0gPMOPyqcJbrEu1?=
 =?us-ascii?Q?umnozKgCPRg8n0LJz41AV8j/tsILGw/OxIPla2GVId+og7/93oKtUgZSZ19y?=
 =?us-ascii?Q?ckFoDbtrduDnSWFgpT0jimNYp9KEWT6MJeI3nS6oV1dEIN2AeprnMSdklg6L?=
 =?us-ascii?Q?0ooY2x5DAbM6Tu8cEMCMxYpDyKSRnVMrGLMFXze+6fsz2tsxX3OHJrrSgxj3?=
 =?us-ascii?Q?m0SKhNqks/xxX8NriORY2ptY27ujbdGsrsITyzqaNhGqHyxRKeytIVrUe30o?=
 =?us-ascii?Q?r6k0P+wu3HuMvTMT70K2LEjyVoIVE39b40sUtwJA5CIjYTmkdRotxyTxES9o?=
 =?us-ascii?Q?zn0Uu7/OHfyMkJpw6LjXExHRDPzRKAZ8eNRHzl8dGfvzpc8xesF6QpKY99TA?=
 =?us-ascii?Q?Ik97HWa2clcnQNn2IA2UiJObEYRPsi9ncXCtK538K3G6m+6hsQBTWKLE1BJ0?=
 =?us-ascii?Q?jbYJ5BKT/aT5imscExrdckIFTNG1xd0lQw5G3IgSWw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6608.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6IaSJRYtJM2zpza3QIqr02OVAPUnaCXhMeozyzA6kzihmioV2Gsa3mgVlzEk?=
 =?us-ascii?Q?UplkgeQx42kZg1eTf13wtowQUJkKXWkhfWYm/PfjlkIXmOLd/idnR6Ffy6Ld?=
 =?us-ascii?Q?9ErJyIf5939z4HDn8JI3GLKMCBhPZ5hkKuaX/eLW6lGpfTrf0kkhX5M0qaC0?=
 =?us-ascii?Q?RtB7dbk21NvzWAn2m4+me+lynQsYOuh/YY4+sZ4jfwqKz8ctvYO0nCHlD/NW?=
 =?us-ascii?Q?A6AM0JLoeJbRYS+P6GID9VRpZgncitX0CNuU7K6TaeQGJ+wBX9jVeE3nh+6r?=
 =?us-ascii?Q?1QvQIXcq0G9uAUY76PSnejIjHuxuSuzo3bJc6u4ojLRklDCoIGEQ6hntLZz3?=
 =?us-ascii?Q?ih78PwnpJiQ74Xa6g+yEREjBNm51KPWtkcGI5+jH0yoER7aLRYyoXza8+Nw6?=
 =?us-ascii?Q?mTOU8BDLxxvUDUKsO0F5W1a5lfo+VRF9UBmd2OPXDt+iianPxg1hOm4+v5ft?=
 =?us-ascii?Q?DcUKaui2V1qp4RjLqQi2R3/oairm95fAysF2WcCptF3xlnP1jgAUyiiOaSpC?=
 =?us-ascii?Q?g0PGH7gto+coGT40k7W2+VF5ss8RN+8z8be7Ckb3/HrRNvbonp/jog1Kvr2x?=
 =?us-ascii?Q?6jlHDe0l/ZoEwOeQbE3CY03agAww3JVx6mWxCtttvvpmqNWyC+RbmAVXBkTD?=
 =?us-ascii?Q?6+2E7vqqjSW9l3QX/31x8nhxWfQkQKIkA6hLIpJj5ZaGiH24g6dkMoRlX5kg?=
 =?us-ascii?Q?RqD5sRWnXoF3wEQb8+61eDPLeW/a0ojaAfD6nKA1TivCaF6wVzpg90U0HspY?=
 =?us-ascii?Q?BU5gc1SseHnwHucTLhOSGSy0Ibt/T/TjxsC2z3n9JA6nwTk6t8fatL6Qweh4?=
 =?us-ascii?Q?7KpDEdSKq5dBdhIRkSHcd01EP6G0atJxGbb4b72/5t4eZra3Pj75uvgbOwBw?=
 =?us-ascii?Q?5g3hYLw/4O31kof/oKbdQz9YpIdRQb4P9r0xqKqzFJmlQGEMYdVsg/CalrF1?=
 =?us-ascii?Q?RSldoWKxXURY0Gsjjryngu0Jghd62GJSNwDDCZ3d0h3jO8OlO500lxIh6kXQ?=
 =?us-ascii?Q?OANKewIQQHt3DqLkmPxPk2P+afCHJBkwVIlwG3AkasmM5Mi2wpkfmqctBiKh?=
 =?us-ascii?Q?jN+Brnz8AzDa8XIH7QBMjhW/BBIoLGMdli1jf96pjs5EnkZM20MHCcSxuOC+?=
 =?us-ascii?Q?6WuX8nFScl/b66zAGZ8J+3O+h8s+DzVZQsVONYWR7oAP8NGK9KYtr4kmQ0K/?=
 =?us-ascii?Q?Kn1RQ636jTn7QV6HtJl89H797hUALUKiF8bw6gJTX0OOCJTwpa8yCZD3D34D?=
 =?us-ascii?Q?AespNocbtrZBxiF/7yllD5NeY+yqZYPqktgsv1Mjp1Jxm9vZo9N8neXbJtUt?=
 =?us-ascii?Q?tBZexmu0CHmhZY73950ibifVFNGN95oqvTNtxXigc6bQQk59Vs/VEXyvh7Fc?=
 =?us-ascii?Q?A/wnjFxj8dVlfhM/0vkLRE7U8FIbWDLIqRxv44xqITnOpTH9rvf3Nnor/BqL?=
 =?us-ascii?Q?UjQSPmGT6MmxRzm8mKLWAMuibEExDT8pdGuQHAHPzxSw2AcE+Q1/1bILsnZP?=
 =?us-ascii?Q?FTvVoHgYYSfVPJp1v9Oa+LRKPKJcxJmFYrL8UE/Y8h7EiV3WFXuFPd9Jvq01?=
 =?us-ascii?Q?WVIyBNhtiOm1zxr5PhI0qxQ9vrDeIxgR5nXwSpSaaLlscD6TQv+ZVuTjO5ry?=
 =?us-ascii?Q?yA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	wXZurtioHIjri1XhZQok/sfXzQFhyNQZ36KEjax2dNLsQymd594rn+kM0cZIimfudfwHZuv9FclecFmV97FmrVggAfSzMgNf644zq47z9eA0P83GBA+4CBzM7s+zsfFxdXXc0nfYawhaWLTl5o0CKa2FzSLdAziX/+Zu2FO2oj9MFHMr01/IZBRnH5YSu7q4oLBkQJbYf3sJG99OvLmMgAgeKu4lCAJio+rIpbcMWs+zOAAid7wM5MgU1NUJ+emsMbb1+7v7w9P0sLfwfSTT2Zh1EDlF0KAodi5gip7Ku9ZGLTR6SDj6QamaSA+WUFKEtUAKXFDBkrdKB7FslqTyBfs3l+4S8CrlO/0OGRe1xHJdm6KAHZoFIDHJY1YA3W90cOyzDhqaNRGPDO6gkPqSZbfE0E3yCgDZq/E39Blk7XlDYM5HqzxcEyy0cOXmRkSg6faFSGV1WUt0AOB7Y5SV2ZBQ/b+D42+/L+ldstd6iySmZbQuIHWrvVBPWf40z38CqGXlyRMCM/Zkifly7wSDEe7C5DvUzDZQ/qatm7E9qI+QshESd+dgb9khgKRf6apM7uLnP/LZo0VibjmLSJDjZAawlOXFkwAGFWE/I+70jOI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4282fa2-0995-4367-3366-08dc7b71254e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6608.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 21:41:46.9167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ivn1bb+tXHaQzjII9Z0hwlS1jAdt3XDGywGKGtPXp1zQj+heyn8plah4koOKoIPKMymBOTYxWqx/XtRogMNylw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7334
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-23_13,2024-05-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405230151
X-Proofpoint-ORIG-GUID: 0xdnhY_Qkuxx83h3-S0FfqKzWt6QI99U
X-Proofpoint-GUID: 0xdnhY_Qkuxx83h3-S0FfqKzWt6QI99U

This initial pkg-config file, dtrace_sdt.pc, points at the location
of the sdt.h include file.  We immediately use it in make check in the
installed testsuite, compensating for any install-time changes in the
location of the dtrace libdir.

Further changes will be forthcoming to properly support relocatable
installation.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 GNUmakefile          |  2 ++
 configure            |  2 ++
 dtrace.spec          |  1 +
 runtest.sh           |  2 +-
 uts/Build            | 14 +++++++++++++-
 uts/dtrace_sdt.pc.in |  6 ++++++
 6 files changed, 25 insertions(+), 2 deletions(-)
 create mode 100644 uts/dtrace_sdt.pc.in

diff --git a/GNUmakefile b/GNUmakefile
index 30726332d762d..0390db77b4780 100644
--- a/GNUmakefile
+++ b/GNUmakefile
@@ -100,6 +100,8 @@ DOCDIR = $(prefix)/share/doc/dtrace-$(VERSION)
 INSTDOCDIR = $(DESTDIR)$(DOCDIR)
 MANDIR = $(prefix)/share/man/man8
 INSTMANDIR = $(DESTDIR)$(MANDIR)
+PKGCONFIGDIR = $(prefix)/share/pkgconfig
+INSTPKGCONFIGDIR = $(DESTDIR)$(PKGCONFIGDIR)
 TESTDIR = $(prefix)/lib$(BITNESS)/dtrace/testsuite
 INSTTESTDIR = $(DESTDIR)$(TESTDIR)
 TARGETS =
diff --git a/configure b/configure
index 40b870f81d6ff..4b235fb1fd766 100755
--- a/configure
+++ b/configure
@@ -60,6 +60,7 @@ Installation paths:
 --sbindir=PREFIX/sbin				Alias for --bindir
 --includedir=PREFIX/include			#include directory
 --mandir=PREFIX/share/man/man8			Manpage directory
+--pkg-config-dir=PREFIX/share/pkgconfig		Pkg-config directory
 --udevdir=PREFIX/lib/udev/rules.d		udev rules directory
 --systemd-unit-dir=PREFIX/lib/systemd/system	systemd unit directory
 --docdir=PREFIX/share/doc/dtrace		Documentation directory
@@ -130,6 +131,7 @@ for option in "$@"; do
         --systemd-unit-dir=*) write_make_var SYSTEMDUNITDIR "$option";;
         --docdir=*) write_make_var DOCDIR "$option";;
         --mandir=*) write_make_var MANDIR "$option";;
+        --pkg-config-dir=*) write_make_var PKGCONFIGDIR "$option";;
         --testdir=*) write_make_var TESTDIR "$option";;
         CC=*) write_make_var CC "$option";;
         CPP=*) write_make_var PREPROCESS "$option";;
diff --git a/dtrace.spec b/dtrace.spec
index 2f1e489aab7b1..7823b13d981cf 100644
--- a/dtrace.spec
+++ b/dtrace.spec
@@ -236,6 +236,7 @@ systemctl start dtprobed || :
 %{_libdir}/libdtrace.so.*
 %{_sbindir}/dtrace
 %{_sbindir}/dtprobed
+%{_datadir}/pkgconfig/dtrace_sdt.pc
 %{_mandir}/man8/dtrace.8.gz
 %doc %{_docdir}/dtrace-%{version}/*
 %{_unitdir}/dtprobed.service
diff --git a/runtest.sh b/runtest.sh
index 3bcd676ea788d..cc9703e12c161 100755
--- a/runtest.sh
+++ b/runtest.sh
@@ -579,7 +579,7 @@ else
     dtrace="/usr/sbin/dtrace"
     test_libdir="installed"
     test_ldflags=""
-    test_cppflags="-DARCH_$arch -I/usr/lib64/dtrace/include"
+    test_cppflags="-DARCH_$arch $(pkg-config --cflags dtrace_sdt)"
 
     if [[ ! -x $dtrace ]]; then
         echo "$dtrace not available." >&2
diff --git a/uts/Build b/uts/Build
index 864b2dfdacbf4..feafa21369f2e 100644
--- a/uts/Build
+++ b/uts/Build
@@ -14,11 +14,16 @@ SYS_HEADERS_INSTALL := common/sys/dtrace.h \
 
 # sdt*.h are used by programs that contain USDT probes that want to define
 # probes by hand rather than using dtrace -h.  SystemTap has another header
-# with the same name, so we install these out of the way.
+# with the same name, so we install these out of the way and provide a
+# pkg-config file to pull them in.
 
 PROBE_HEADERS_INSTALL := common/sys/sdt.h \
                          common/sys/sdt_internal.h
 
+# The pkg-config files undergo a few translations with sed before installation.
+
+SHARE_PKG_CONFIG_INSTALL := dtrace_sdt.pc
+
 install::
 	mkdir -p $(INSTINCLUDEDIR)/sys
 	$(call describe-install-target,$(INSTINCLUDEDIR)/sys,$(notdir $(SYS_HEADERS_INSTALL)))
@@ -26,3 +31,10 @@ install::
 	mkdir -p $(INSTSDTINCLUDEDIR)/sys
 	$(call describe-install-target,$(INSTSDTINCLUDEDIR)/sys,$(notdir $(PROBE_HEADERS_INSTALL)))
 	cd $(uts_DIR) && install -m 644 $(PROBE_HEADERS_INSTALL) $(INSTSDTINCLUDEDIR)/sys
+	mkdir -p $(INSTPKGCONFIGDIR)
+	$(call describe-install-target,$(INSTPKGCONFIGDIR),$(SHARE_PKG_CONFIG_INSTALL))
+	for name in $(SHARE_PKG_CONFIG_INSTALL); do \
+		cd $(uts_DIR) && \
+		    sed 's,@SDTINCLUDEDIR@,$(SDTINCLUDEDIR),g; s,@VERSION@,$(VERSION),g' < \
+			$${name}.in > $(INSTPKGCONFIGDIR)/$$name; \
+	done
diff --git a/uts/dtrace_sdt.pc.in b/uts/dtrace_sdt.pc.in
new file mode 100644
index 0000000000000..c5506f9355d92
--- /dev/null
+++ b/uts/dtrace_sdt.pc.in
@@ -0,0 +1,6 @@
+sdtincludedir = @SDTINCLUDEDIR@
+
+Name: DTrace SDT
+Description: DTrace raw SDT headers
+Version: @VERSION@
+Cflags: -I${sdtincludedir}
-- 
2.45.1.275.g567cb0950c

