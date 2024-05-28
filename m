Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5C4173336
	for <dtrace@lists.linux.dev>; Tue, 28 May 2024 17:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716916246; cv=fail; b=XGDo5oe4MdFAYrr4Wz/ViV1FxbQA3pFX6/eIwVy+YZnTfJkMPPopr4/Q6yohzcvGBVtCnyovGuxSlcKHQsD1ItmWRhN338sc0Ymjqi5ylgncjuDuFbsKWzpAG0wwWMEhFiOvmcVQome+GuDY2HZI1SoXFI5T+DJelmS8Ys4sVrE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716916246; c=relaxed/simple;
	bh=gpcMTc1EfK9cJnCruePLEtuCRqm4cQ0e7XW/cOLZ6KQ=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=c1j56gKSnrnlEM5lpQppb0Ye3gcQRGybSWpUGljVjriAVFuMiidztdIXjmHNFbWtDkp9B6sCLMd2/HEAQhFl7EJj6ViLu2cjJ9g0wRtObL3bDcPvZkgnRhlEXNNY7i00o2skOMto3EG5YRkQLkfcjyySc78OrsdZ+ehtUX8YEuk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44SBmvuY009057
	for <dtrace@lists.linux.dev>; Tue, 28 May 2024 17:10:43 GMT
DKIM-Signature: =?UTF-8?Q?v=3D1;_a=3Drsa-sha256;_c=3Drelaxed/relaxed;_d=3Doracle.com;_h?=
 =?UTF-8?Q?=3Dcontent-transfer-encoding:content-type:date:from:message-id:?=
 =?UTF-8?Q?mime-version:subject:to;_s=3Dcorp-2023-11-20;_bh=3D1HNkfBc/xLO6?=
 =?UTF-8?Q?QqzkOu1w7GfNLjKRXhMgyrQxONDydM4=3D;_b=3DeMajMkL0pofa05Btr6ARKfR?=
 =?UTF-8?Q?Bsu1d1yUmP19ElTHkjiTAJ2bmXt7oglp8GFIrx+UvzWFr_7QfF/UHnQexCDPjZU?=
 =?UTF-8?Q?LeKuhJ09ihumT6O2FU/zCrkqKQGxpiDg5wwsUEW21zQcE5fGQuu_8DeN8vvK/t+?=
 =?UTF-8?Q?3BwusF6bu3CwcMVR6tetUolF5oPL3zE+zIEQk5iCTRwtsq/9sy8JSi/S4_K5+B5?=
 =?UTF-8?Q?i7WQMMHue7SUXMGWZrfR9Zz2rDy2COJINWHvbvFfrlC95keXGk9qChazn9jZkl3?=
 =?UTF-8?Q?_bMunxcVxcKAW83rzq9aj6qOrfmsQPOsRxxVc+OC+DdXmGu8FoSOuoIjyMCcVsn?=
 =?UTF-8?Q?MYNWeI_mA=3D=3D_?=
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yb8kb4wyq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 28 May 2024 17:10:43 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 44SGlrUE013206
	for <dtrace@lists.linux.dev>; Tue, 28 May 2024 17:10:42 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3yd7c4d50m-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 28 May 2024 17:10:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OwEJXER4YdlOnjntuuyIi918pqdeUzy+xMMgUr60V+oP2+ayTz5HnLyhXHye2RZlVU/+uugrzzWvpYxi7Rq1NltJU8AGmRtt5CeMfzWGB+lNnk7gQHHZPhhsAPecsSqERBm2GlFvRcmxIb3IEyGZ9HDR5XUq3F/y2BD+NenHHE0YmOXfUy+ejaHksZz9CVrMR57B1eB4ljk2rF+owjyqqo2m7Q/TzQlv5lJjt3e3wi6g2XB9soAaDcw/gTNbVmX0s5AKvaJ0T2O3PRBKNqNs77FS+4z+DAJyBW6OzzLMgRsh4F1xrk28XLPTwwNCwsMxunHNKCQqu8c4sP16B5swFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1HNkfBc/xLO6QqzkOu1w7GfNLjKRXhMgyrQxONDydM4=;
 b=l6JdZwadzy+KdbEGGc7vIIG5Ztk8Xkywx8PKNMOnFcpK1C4SQTbZDVtTeTYV71wZ5lYVlboqGmaAnDCQgtLdu4Kb3Q4TS0/WsFtuQuEWY99GKoLmPBErRyf8ADTsFCH4VWEuNtfEVOu0bM2Ty5raZqQr3Nk/1TLrCgy3/2ikjgkVJ8PD2GBNlV9rUZn19s4/BZF4W89bsnxGc591nNqDu3j2l+NT0ZLAw00jBzrKej1SQoKRUKrBvS+rFKcgi9TtPdN/p6z1mp6co1X6mbdEbtNot2f7iS0dYnsyFrExXVl8Qpeq4ngcnrpLocVbqNOqb9ifuApjxbY+v2gwX0Dx/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1HNkfBc/xLO6QqzkOu1w7GfNLjKRXhMgyrQxONDydM4=;
 b=J+/pzMKYe78d9ZVJenHPh7aokgEtvR8DZGk72HZF87s0zuOHH4VSvul4thut0eKGJY4gi7tj7IF+A6ANiidnOqUDvDoiNVjx+tJEH0aP3dICAUrjSsDfbVjBNPynciz+/xkhwFeXpby/7Cff6w8zJr7rqOIa1lk+wXOBJaqiomk=
Received: from MW4PR10MB6608.namprd10.prod.outlook.com (2603:10b6:303:22e::8)
 by CH3PR10MB7161.namprd10.prod.outlook.com (2603:10b6:610:12b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 17:10:37 +0000
Received: from MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df]) by MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df%5]) with mapi id 15.20.7611.025; Tue, 28 May 2024
 17:10:37 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] spec: install sdt*.h in /usr/lib64/dtrace/include/sys
Date: Tue, 28 May 2024 18:10:27 +0100
Message-ID: <20240528171027.42307-1-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.45.1.275.g567cb0950c
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LNXP123CA0004.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::16) To MW4PR10MB6608.namprd10.prod.outlook.com
 (2603:10b6:303:22e::8)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6608:EE_|CH3PR10MB7161:EE_
X-MS-Office365-Filtering-Correlation-Id: a95fd9c8-cb09-4c09-a7d5-08dc7f391839
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fZfWB7H3+UvA9ipt1CoTkpff0GJUWv+LnJgDRfl4A1wHtmnyLukgmbie6ous?=
 =?us-ascii?Q?Q9yrgiweCD2+wSYRo1/7uI+4hry6UBD9BJvjqmkL1Mg4ikVtiyu/XJvn7pyt?=
 =?us-ascii?Q?5LeATVRTKrN6SnpebGs+F4OdRxf5rkhPmVeFDSdAzAsHLmFSKETAxbUVVrTN?=
 =?us-ascii?Q?yGS3/Z4vgab82nYpsgXUQcpkwiDfmSlzpOhcFMawHYb5wl8DCcKo4kXXqhBO?=
 =?us-ascii?Q?23mVUSxVji5Pm1voPkYx6hrnj3ckDQfObRSAzjyZSmDUsGZuisJc+JidjhZT?=
 =?us-ascii?Q?DH8+TaCZP3U1OwfmWbejGF6eZXZbNBPDC0elghTlw8Iulqn919e3C9mJ/z1l?=
 =?us-ascii?Q?Z1R0SMcaR21HJtm5HT6k1RK+szz/ngIIiThBIJt86W+X/AxLqDqZCztzrLt2?=
 =?us-ascii?Q?erSOO1f4ARIdqIV/sRMb2EXN7SS9L5kPr48pMDnfreruh2WmDJzqy6ehX5BF?=
 =?us-ascii?Q?EAoZWBS1e08JDDlx+njJFLiieRkgvUPopQnKjxt8QBCqq/+wf+XC0yafsIn/?=
 =?us-ascii?Q?/i7DjdoPmjjff4D45nrJd+YTt+WeIHi4M83CHaTcdde6Z0EnyIjmbXpZ4Olf?=
 =?us-ascii?Q?u1VK2BHi5qsQ4J1GDiRNjBTxUmHqa19SQSWZbaJX0uBn/ojaSTxAG7abYVs3?=
 =?us-ascii?Q?Ut8a/IMevu+gqG8e+a/7dCmXf6UXoGB0GszOPJj/1d0w/Zyt9NQrDUbujPyW?=
 =?us-ascii?Q?3emCtnLRYirFcgZg9sYHmcRa9m3X+GmFA5IZW84JCtWLruoZ1XWt4YujCFwX?=
 =?us-ascii?Q?V0HsmQ4mIzE79X9LVSdoEmf6Oudxs5cdPEXz7gM6maM3jBDOW94EPu5r+LKp?=
 =?us-ascii?Q?mfFuF0eCvpYd+9Oil64ttNVlwvVFmdDaNA2UGsQ16NyKBnwyDziTyJcHoeEN?=
 =?us-ascii?Q?S2u8OaIiU5K4Sc9WT4WZjzvf4sYJAf9SCOSXsjzlrCZ+S8mYhZZra2jraIve?=
 =?us-ascii?Q?8AKKRjcIwaKzV/NQ7BSZ/2G/L+6fmb2kKJDb9yVLlyJ1kS5ffDptoaiURGwG?=
 =?us-ascii?Q?oEC4/Hi2Hx4H0lE4GMhlhYEevpP+zTERf5asWQcIk8Iz2wBaLcUXn1rlkysy?=
 =?us-ascii?Q?VQY8ZEeRztgm9MBNKu/2JoBnU0PLOgIGQVmAwg4sQMFNqXNLdebwgx3Vz/JO?=
 =?us-ascii?Q?CvFwdbclXhHnLkOmwi/hyMTv0Z5OW/Y1RPpKXQCDgtuRp73DFUmzhSgM6/sj?=
 =?us-ascii?Q?mNiEZsgxctx+TPU/tJ6x/1uBP00C3OZ0K3gq3F8QyOHybsNK/6WKNxbp92k6?=
 =?us-ascii?Q?iFJ/JxHQd/g50cGUuib0xneS+SyZaYRS1h+TyZpAAg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6608.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8lylqatOG2H+OsIcPoThnj0MCrk2ESUdHXzlpwZk4ZG0wDfZfQI0kDj96q9u?=
 =?us-ascii?Q?0yaTBR56E3adM2yqK6q/EuvdM0B8aonfNxjSTqpFQrcb673593RWkLRWu6NJ?=
 =?us-ascii?Q?ga+mTZZQySPqV8v1J2jSUyoWjfikI400pgaAoZrcyjIEqu6KP9rYkmgZU3pQ?=
 =?us-ascii?Q?IKMvsrNFfYmFX358wcveMNJJ2WBRWbfwnFbvaZ+bixceMSmyqmbQV2+eKbTi?=
 =?us-ascii?Q?c6CmVXdxi/hKLNDo9llJ2pC4OAQVForyCa3TrlpJXqE2a3oVhHrVdibTWOuq?=
 =?us-ascii?Q?vTGF/cGb/u/4H5NYx7wKAafueszpBJG0UcNuctI4DuENqQrbY7g82fSZtse6?=
 =?us-ascii?Q?yrC/0bTqb1EC9b+OtteI1yhIzlF80Jy0ux2vfdzHd6+Fb+63ECFxm2414YC0?=
 =?us-ascii?Q?44OOrbm5hSp7qq21kEmolCNayzwI4TTEpIOSd4lFtqHnxyxcmsqp+x3BuDeh?=
 =?us-ascii?Q?Jnt5YYmcm5LF9ItFag9OFlOMhNx3Qhx77v+T/EqSuQkpTs9QzF1xDsSlDYFf?=
 =?us-ascii?Q?8p4yIWfHcV5p+d56UAvHgxQ6i2UOy0wy5HcZqR/C6G3q/Xn0+G69B53nvviL?=
 =?us-ascii?Q?pA9E7mABuiGKgpX8HM6OD+b3qrRqI5SmhZmS6kq+dWTptTbk/Wt6NAGc3Yp5?=
 =?us-ascii?Q?OTHnUG8gbpt0yEIGxyv2Y/KvnoUdN+KJ2faYJJ1qIopx4k68oRyYOeEN/zSW?=
 =?us-ascii?Q?zStl4VuLVVoavzljv2ryp6CpB2b0pA/JSqN12jghvvCGI1582Ffe0Jbi3vE+?=
 =?us-ascii?Q?3IMU7dOafE/UkgA3JNS1Sxq+f3F+uCV4SK5tXPRCBBTIuK0XUX0BXQdz9bDJ?=
 =?us-ascii?Q?gsGoGkUS4+OJe6PrQUg7t/ZJj74Oz2iyfvM9kkJNLfREcsckV/1B1Wt5pcxV?=
 =?us-ascii?Q?5+uUacTj6IChp0IyPYegQ77sJC2P5W5I4uk0UY9OkygqLLWHwp/3t9hTm5qO?=
 =?us-ascii?Q?CoNHZ4yKBwvxgHXhQU+K4p1wzWUNtnC+U5L2qS6j9DlV0XdnOUt6opU42yuF?=
 =?us-ascii?Q?qI+xa6i5XnCFdi87GMHX9pQbJrBD3H5KADfgw1OG3s2Am4eJ/0ezALZBHf2y?=
 =?us-ascii?Q?XAMe0/zefq0qKzLFl2hmKqpTdTztFoW1RWjgtHCO3eGupJA2GuWmp2q9z44h?=
 =?us-ascii?Q?ygo4rI1oa/m4cvoQn9hKKQnRhjP+vPWnDw/5z61jlvtkiKCspY46G94+MHko?=
 =?us-ascii?Q?idx37VLkrR4cdvDbXiMuO4uLbx8mcD1L7t8wBcLzIDzPWmJ/35O7BDUliLqd?=
 =?us-ascii?Q?cTghkDvEpIZFTohOJyC+saOJJAqrU4z9wRpKX/3fjroHI0B9hRuVbhkpl5ce?=
 =?us-ascii?Q?xm0PEXZmSoOpsNERbv3GBZ/rxmrmUKk+5gtHKISYfxstbtSxN0e+0ca1LiSX?=
 =?us-ascii?Q?pCXiHcMAbdvW6Ayu/6r1psO3XoQYFYJRS/dFUiz2Fc6c7IG3oAivAcb9PIxj?=
 =?us-ascii?Q?+osLVUWEEP6TIWiD80jkf0yS1YxFYY6RX+ivYp9y0651upFsf9lpiGs7m1G4?=
 =?us-ascii?Q?Or/d31nXNHEDWCeVkptLHucci4EpFTVlWSz8V4YA0Bxwu+iFVT3X1gQ6AOXA?=
 =?us-ascii?Q?Dp4oe3x/omFgqVJEw3n0dV1kLBddpGD+wiY9N7HJMOEBMZ3CX25vlqrUOY86?=
 =?us-ascii?Q?eA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Jvy1yWMP51zz694BIRwIEiNLR6QeB1sWXB0A8XOrw4vzWtIho2XuJq2iZpmQlMAsuWLDKntobfRAV5CjKN3k+Kyl/hlkkb/fzHDnUiWnEYQbevVGjhB75VeWZc/nDengFBm4xAk3RwcXN0BJfU1+S9XpbI5fn77QLgvyBIj16KmY7ouaoMl7qAK+VKbWXo6W46x08rYgCfd0sjOEaflZtMigdUPWTTCEDxTSEDRGm7FD9ZpycqEYGygAVe7myHyswtbU+8UC6OY18okAPvnY06L9z7FUy0mPhn67gnhH4DL/N+boKXsI7bkhK7AXVK1oWuXAhZdnovHVzHLYO3rhyc/3w3YZ+DY+Fgo5zdB4+7ZED2LRS4kjO+lS1Cdv63sjWL5uMr5wXdEjL0x990K6bOa8gwA7OlHDNbB7PtNLzQVN9JUw5YLC8QH5URJNs0JajaiZQ9wLVIe8lrKGPcmYpYH8xPNhgYQ9qPeibHdPVpzZ8SYmRzp1wmRrsZo33KRNYMCdOinDVtfa0uSxFomhTY65atqlmRhHesy2L/+3I81lAS09VHX2yLoMN8DDu4akwZv/nplHHzXK+0s5VxKSYS6DG/1DNUOPwkOt8UHrVIY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a95fd9c8-cb09-4c09-a7d5-08dc7f391839
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6608.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 17:10:37.8247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gyWnXhadUutGdWpKRUikNnGCr35J2NBm4A3fOgazUeOPxNMZQRYFOlAA4ZevCg2pWlOzT2touoCTS6URfVi3IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7161
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_12,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 mlxscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405280127
X-Proofpoint-GUID: IqH-Ky5sVt9ijtyt24axXN1-n8RuOvyR
X-Proofpoint-ORIG-GUID: IqH-Ky5sVt9ijtyt24axXN1-n8RuOvyR

This is the specfile part of the sdt.h move, rendered more
complex by the need to clean up the mess left behind by the
old sdt.h renaming.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 dtrace.spec | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/dtrace.spec b/dtrace.spec
index 42ea9bc339586..28eeaa4783769 100644
--- a/dtrace.spec
+++ b/dtrace.spec
@@ -86,8 +86,6 @@ BuildRequires: binutils-devel >= 2.30-58.0.8
 Requires:     libdtrace-ctf >= 1.1.0
 BuildRequires: libdtrace-ctf-devel >= 1.1.0
 %endif
-Conflicts:    systemtap-sdt-devel
-Provides:     systemtap-sdt-devel
 Summary:      DTrace user interface.
 Version:      2.0.1
 Release:      0%{?dist}
@@ -194,11 +192,6 @@ make DESTDIR=$RPM_BUILD_ROOT VERSION=%{version} \
 sed -i '/^ProtectSystem=/d; /^ProtectControlGroups=/d; /^RuntimeDirectory/d;' $RPM_BUILD_ROOT/usr/lib/systemd/system/dtprobed.service
 %endif
 
-# Because systemtap creates a sdt.h header file we have to rename
-# ours and then shift theirs out of the way.
-mv $RPM_BUILD_ROOT/usr/include/sys/sdt.h \
-   $RPM_BUILD_ROOT/usr/include/sys/sdt-dtrace.h
-
 %clean
 [ "$RPM_BUILD_ROOT" != "/" ] && rm -rf "$RPM_BUILD_ROOT"
 rm -rf $RPM_BUILD_DIR/%{name}-%{version}
@@ -222,13 +215,14 @@ if [ $1 -ge 2 ] ; then
     %systemd_postun_with_restart dtprobed.service
 fi
 
-# if sdt-systemtap.h doesn't exist then we can move the existing dtrace sdt.h
+# Clean up the mess left behind by previous installations' overwriting
+# of systemtap's sdt.h: if an sdt-systemtap.h exists and is a regular
+# file, move it back to sdt.h.  (RPM itself will identify and delete
+# all the other debris.)
+
 SYSINCDIR=/usr/include/sys
-if [ -e $SYSINCDIR/sdt.h -a ! -e $SYSINCDIR/sdt-systemtap.h ]; then
-    mv $SYSINCDIR/sdt.h $SYSINCDIR/sdt-systemtap.h
-    ln -s $SYSINCDIR/sdt-dtrace.h $SYSINCDIR/sdt.h
-elif [ ! -e $SYSINCDIR/sdt.h ]; then
-    ln -s $SYSINCDIR/sdt-dtrace.h $SYSINCDIR/sdt.h
+if [ -f $SYSINCDIR/sdt-systemtap.h ]; then
+    mv -f $SYSINCDIR/sdt-systemtap.h $SYSINCDIR/sdt.h
 fi
 
 %preun
@@ -253,8 +247,6 @@ systemctl start dtprobed || :
 %{_sbindir}/dtrace
 %{_sbindir}/dtprobed
 %{_mandir}/man8/dtrace.8.gz
-%{_includedir}/sys/sdt-dtrace.h
-%{_includedir}/sys/sdt_internal.h
 %doc %{_docdir}/dtrace-%{version}/*
 %{_unitdir}/dtprobed.service
 %{_unitdir}/dtrace-usdt.target
-- 
2.45.1.275.g567cb0950c

