Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26707274B35
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 10:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752574941; cv=fail; b=SjLlvDKrrZhYDNuB+ck7ma0zJLuo9ESz5TjCAaGbEbWB2AFbZpLsYBKWOgJBtktqO+6FYQLVJhv/tBAIx33HUHqQ+0c4hIjZfFRAtIOfGPjNCNkXb5NQ+ZUCQXg6SeSbrhy4P+ro8VaBz30iKFc5tf1iAxm0lga0d73ckbtEcNc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752574941; c=relaxed/simple;
	bh=V8SNt2ysrP/cV7gceyCn+kR6Ifqwlfr+EdpcV38mNzc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=d2n5TMVdjFOpwOrWp0NSa2LxvBLI88Rvf/TlTitVl/kkdq8nVT7rJCB2/3rVWqzP8Np2s1VkpamB1fQabVwwvht1F4IAKLE1bnFl3xdRzitK5ccxwdpGyayn4GHu0Jfuz+363PAgpCLwjBY/8Loqs/jwF2T8xjm1pV/yxe/LlbI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=rjYzoI9d; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=s4HBCoqx; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="rjYzoI9d";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="s4HBCoqx"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F9YpZZ020374
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 10:22:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=En6i6S2EQbxe+0+8NF
	/cirQpPoUzFe15AUKKW4UR58Q=; b=rjYzoI9dM+u6TPziX592XZsZaHRPFwhD/o
	OWJaqiRRSYNkmbqpgGZVMtvB6kYueIQcvPGW0fVYibYWDarPdPvYvsFk8mhA08D/
	kxBALlHBXZV3lZ8st+t+6Nm7FzPjBL0pmbn65jh6p4fPVuDXtZY/RBTJmqwQk9Bi
	zhkSwnZ6B+u46Ks/FVclC8oXQYLRq8lCn8oAJDfR+RvwT8kWzUbrpY/yJjf4gc6A
	9us2LSiljrUCYN4FLqljqOHxab8Sm+xCvJ+XLDqkNsOTePk5KvHUQpo55QlFqbMA
	b6M8qK9gE0HPLJ0nw8flVdTq9tsFXyLVFTj925RulF3M/Tkjj4xQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47uhjf6sgs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 10:22:18 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56F8rT2P023735
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 10:22:18 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2063.outbound.protection.outlook.com [40.107.92.63])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ue59s7dq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 10:22:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VNhzgTFNVUu+fTOUFWpprwd3YGrFPfdFt+7p31Uebb+aZdu5Q6N1dS3gNswk3yDq7a/bzUr9GsfdsDPcXonkwpAXoa3DaJ/SPt7hL/SmIp+kq+P1W1FxZD3jydNWpIw8lWTQOImhNfbycv+IRgbyfDg3uddYXkvU1ViqjSsu0/TVBWAPJv1JLyVYRipe79HWmSX1S4oi+gHqN+yDhMjAGUlBm0QBciSs+2tl/WIrdigPWrvFIlSuKyKdIOTTXCppYrCaO8QiTFBOQkM5UljvToj6zkG3kBXvet++eslBDK2nPwNoAGUqVK5/ao+4RMxjodcppYVCmgY3PibAyaTM1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=En6i6S2EQbxe+0+8NF/cirQpPoUzFe15AUKKW4UR58Q=;
 b=tETMFMZT8in450ABd14Vk869q1M2nIL+PCAsGpdRagkp7RREC52OmUUOe4tFz4tDK8l6nT5SgpTe4e1Ym9mPlOoSq0HrETJzRK9a1EAoebL0cl1VDaoEHJd5Xf2B3NUVBUsDX0fbB/5iPes2gdb2EGT25xR//u1a4YWabhwvGq2lBj3aOlUfITDoOMa2udoOnFbZmBsnpj07vJrdONa/+rIJZIA3IkXae2mUInq4CLbA3nmcxO5pXGOh2DjLHcImCjeSSwW4CGSDOUjKCxA2FrcWwHyra950AhmFVuYdBER6GmkKZVAaEzzXMf66nELkv6SnxA7rTUnEU7tULONbBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=En6i6S2EQbxe+0+8NF/cirQpPoUzFe15AUKKW4UR58Q=;
 b=s4HBCoqxKxTeh5PQE3917ILtTbiTVWS+JfrtYBaVtXiClRnzNbMfyrm4TAE1ehUxGzgzYlQpeDLRSwnpqe0Y3axzj46YT+vSr/oteR7ySMBwqKxkx5MBbYpLD9kFgDJIe6zjf+jR/82lcGl9zGDgtYTX6kLQ8hgR67GSQ5TfWhY=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by PH0PR10MB4471.namprd10.prod.outlook.com (2603:10b6:510:38::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Tue, 15 Jul
 2025 10:22:15 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%6]) with mapi id 15.20.8901.021; Tue, 15 Jul 2025
 10:22:15 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] spec: ensure the include/dtrace hierarchy is included
 in dtrace-devel
References: <SJ0PR10MB56728CBA3250F59A56757E98C257A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Emacs: if it payed rent for disk space, you'd be rich.
Date: Tue, 15 Jul 2025 11:22:10 +0100
In-Reply-To: <SJ0PR10MB56728CBA3250F59A56757E98C257A@SJ0PR10MB5672.namprd10.prod.outlook.com>
	(Kris Van Hees's message of "Tue, 15 Jul 2025 00:38:14 -0400")
Message-ID: <87ldopwy7h.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO2P123CA0009.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::21) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|PH0PR10MB4471:EE_
X-MS-Office365-Filtering-Correlation-Id: 56ab40bb-b0b3-4542-0c7f-08ddc389782b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kET6v0lgWzqgjvLdW9WsmRnpp1gDxTgc7RlwuGpsncZ52yxTmt5z9E+QwDtY?=
 =?us-ascii?Q?1jOCArfRFVFn7wu7hRuRZbsuhoTDc1v1pdF9TLCFpJYZjT4IkiM1NrfOyjJa?=
 =?us-ascii?Q?ZKA2QTvrlOmFwc87WrXyLrWUrJf+ZrpwlavA9YDBkHHPn3nBjQt3F4MGFtRI?=
 =?us-ascii?Q?O39KvJ/DCtfV1VQKLZWYMuPpZZUbiGJl16hz1q8mXZlVJK0PCbVqJnr7jKJg?=
 =?us-ascii?Q?GlLcX9FTXiWDjrYHvtkLFyKcSosbJbjzeGbzpaSuKwt+2BX/TyRicX8b/SO+?=
 =?us-ascii?Q?ZvtcOiDO+y4IsWNXBMdQttjnmDI+/Ho50Y1yf0hvYyPBEHecA9CnMql8f6Cp?=
 =?us-ascii?Q?zqEpb9wPyaTGC1COaVdIaaM8KDsF+ZNz08Gc+L4hREkcARJCZTaDTk0AGnd4?=
 =?us-ascii?Q?Pe8pX304VEBFD5NZFlas2Pu1fWIOpUpJhn4faPYUNc7pFxH0GtDmn5s5e1Y2?=
 =?us-ascii?Q?yGd8JFlr4OiV1a2WAS+Usi7Ru2KCNZz0XZQC/hyfEDezfwzevUTP2u42zFLf?=
 =?us-ascii?Q?DdcmB9m8dERc6sEY+sXdcQOtV3bMiwbufI9egsoJlV+UyxY8lqMo9uKZZq0Q?=
 =?us-ascii?Q?+QQP3Ec4J2vK+68wZN5A1SnzVDeX888iUtMy/Q8nqXzjeQMekbLynOkdD6/u?=
 =?us-ascii?Q?t0hc/xG+NMguaOgaM0wsdML0F2KqdhlCONBAIQLvO6azpgzC0Ai8mwyEZvy3?=
 =?us-ascii?Q?BJv/MePO5BzY8mw2rZ/itXydy5XFSD6FvxhneJBwztFuLyxGxoophUAddRbo?=
 =?us-ascii?Q?6ToCkujunMc6xAqSmMmI63v6WYS+FMOCYV+s0QmS+Vo2Z95SAThvbXgsRt5P?=
 =?us-ascii?Q?c851Djm86PwHGAt3YjqZe44+hvlI61sQyRjhB5sAUIaC/xTsLtDQPWWUUEgp?=
 =?us-ascii?Q?CIwgY3WYN+OnagT/khxaKmgDjEIiPZUoCMrmhe3LD+Il7sbpJttf62DYWe0b?=
 =?us-ascii?Q?TJ16RxzJXSxiJ29XbXEJ9jGImW4ytvzug8uKHwQ662xy98SSl0IJo/DJR2gV?=
 =?us-ascii?Q?faxlJM2TIiQS+lSK4p4Ay1jKrWJJQIf6aSGmNacPHTWERg+p9BIUp13hfEJK?=
 =?us-ascii?Q?t0hooVGB2j713nBA12Tab+pEnIzO4BT2YInt8+l/ShpKQjnnRu33MYVqmqZE?=
 =?us-ascii?Q?EHF0tZBGl47TDWDuBcvoY5unFBSHCXt7nIwn1VapsqScCL09x6NhY6hBxqi4?=
 =?us-ascii?Q?opCRn1XaqBQeyIXTUzWHO4rQcUVCzWTkVZ2W5jxBelS5eLz4/7eFDlcwE5R4?=
 =?us-ascii?Q?F2pmGffJm9vJYqVKl5QUQBnimvynqkwwkuaon56BSF4TMaguMB/Lt0ZCpcRw?=
 =?us-ascii?Q?qLvHPYmsiXprRHKW1eA0cp+nZT2DLgzf7ULIh1nBCxAeqo4cDACMhrkPDdM+?=
 =?us-ascii?Q?JfKa0tpE14FbvBq6WWI5hcRLVAXmWpT5tK0Qo0uzf77TcelXeQ/arY/bEfFT?=
 =?us-ascii?Q?CqCWmzKbaoc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?X3WcduYPttzJXqsoZk62IzrpILNwUePLanLiDjWGxhgU9FaDnGNQf0ZQBKTt?=
 =?us-ascii?Q?n2xEN5iUT2hOlQprqbt5tq8hx7HPaHjdir4aO2i5NpIzxsrv1fuVkCW+tYrk?=
 =?us-ascii?Q?dsy2m7Zv1TnTnSj8bg1nWRib1siQmE4xueziruk5aXGK82Sjjph/9NLslhWZ?=
 =?us-ascii?Q?2XgmCcFiyDJDQPzJZ7iCjoMuyb3JyGC8UqJIQXpZg0KwqsvaXQrGnfFwLzHX?=
 =?us-ascii?Q?tklNb3maSJw3g3dV29+VxQ7JGDpc4vGqtaou5wihcNOtlJTZjGb0PdFxDp8G?=
 =?us-ascii?Q?lggeZ3SmfzNhAevDfRoFtFn9tvIH487yG48vOojplqjXVUJGttIeg1+iznlF?=
 =?us-ascii?Q?N2REoSvFdgZQ3BynZVEJYRyVII9SvL2LtMqF+7pfk4ievTDFY/mLT5wiLjTQ?=
 =?us-ascii?Q?Yry6CQvYwGUBw7r3hG7uKt4HEDrGllyP9v7fsMqQSDafPJwE8IpVUo02+uUs?=
 =?us-ascii?Q?b7rxrx2ek3Wu9McZoUck2wNkUBDu1aIK00kxz9vz5i0Sp167ceEJpYuhoFvL?=
 =?us-ascii?Q?Bgja8h7mMVTziuQ+Drg/MrPul/zVfPkaTBGAeuOB81y6533HHDdeoaANqBTE?=
 =?us-ascii?Q?k408GOa/eTGzoHVuLvPBlH8k9aIEVnfxWnjalNddMw3Vg3BmIDQ47tJBFbXg?=
 =?us-ascii?Q?NwbOoXgmSnNTVbzGze7HK1qG9LBbZhTzdBCDf2fLvC283SCevlVVHqt/HGUf?=
 =?us-ascii?Q?DcJ8R24HMh0K7yumrYwGjMzNn2Vn47Gfw4ieBOVb5RLwghD0UAQqtEIMwYQT?=
 =?us-ascii?Q?cxLtWU+y4h907gkQFskgjm4z9tHXIRun2vW+kvL5Vh3hLZ3usejztbM0RBad?=
 =?us-ascii?Q?Y4ifvZ/gzBEpJ1lrB0OFdoKtKCyOqZbS+nLakAebxjTfWxAVIbtGckOY0ggy?=
 =?us-ascii?Q?0HMdBLD9c9gjV1GMxTeBd+J1gnbjrxWruQQVbLmuUzJ4qKhC7R84xO/9yC9H?=
 =?us-ascii?Q?FY7Ax183JuiHZN2Wtz9ZM6w44oN9wg4lSsYC0aYLHEoTlxKRWFHS1BoaOcdc?=
 =?us-ascii?Q?On8704++vLBMogdH456eDP5en5l84C2RIUh+cva5DcvjGdzhtcVUmH5q5/b8?=
 =?us-ascii?Q?dvkV4Ktuj4F1zQXUBJ1xFIrqpjX6Wdg40379Q1sg4FQ+BMnoFP3xl0nz/lzs?=
 =?us-ascii?Q?2RrYMeNAbiX8jMz6bCwldWIZSlTBFuvjVRPLpur/iPMmeWuWTLhApPTkVDSU?=
 =?us-ascii?Q?yZYqOco73ag15JaKvFBfx9BGdf+KQXsppoXU3Vp+znel/QxnXa9mKkmWnrzf?=
 =?us-ascii?Q?uy0ceYWrnn5ILEyKguI7bTquUEqRemmh59Uv0rXMOnaJRxdErwIJuFmKdMK3?=
 =?us-ascii?Q?x4JlVPdvIPCLog2jkL1/VHYjh8vyDxxVxIM8JOSxZlewGMFFCk5CT3Z/jtrm?=
 =?us-ascii?Q?yaj6GeNvVk9v0tEdZUc9Xzv8dfSxrzQmC8asEwiIflseXIMjrSHwKHseNDL1?=
 =?us-ascii?Q?OmbOIPcsRfQVRbh6G1v+6RAkKGOGsgsbeQ/HMvg4EoHOVsz/Eshj4JUVQf6g?=
 =?us-ascii?Q?o80R8AIjtpmguroYTKzgX75Hu6kcMz+IA+3L750HdTHCt1uVgSqNmvYzVIsq?=
 =?us-ascii?Q?uih+AdbdiH751T/77sHE9gBZrGBlbr0xnV3caWHgLVvc5atzeSYhk3JU8fcM?=
 =?us-ascii?Q?yg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IrUX1Kp6YEJ78a04eDZrBLwqtBmpKZG0uE8gf8axZVZZDHq+nWdA7GNpE9HZZVGL2GwMvsxrzFaF0pFeJPuCBZQI9Gg6wLQG8HPhc9R5ae/q5/X4RvW44yrs3sGV6oO3ofw6/KlQ7v2Aq7K5+OIVopoCKeiCWRHHxhmJvCDyGJTAvSyDz6iHFrNupt+fd+Eoa8LgUSiAUVmoP6s9M4utvW2Rn1c8T6/wenFqnjiD1b3IjvUtgqbIglkaJypcROCtZecYvu+eD82AZ4mXPBGN6P3T+SEg1BQ/GV+0ikoyOLwsqM28ucsIyqpFS8nh9ahYZWIAmyLh7fPGL8T26dW61rJVy3q4yyZKRGGXyCZayr7DlMZ+juTQe98ua6yl69VMWwO6WA4jOk3ZZ20aDMGaHg60uVmKjfx5Zpc8eGT9JxmgoVsfqerGQlibWX3QemQ6//UlfcUdD0LPgBbxIdq4d8JX4HQbh5L8iBhrGta/JcoXIwUAuLjjfPuxPnInkaBdLrsU0dcn2z/T/xPXglTvaJFvI+G9W1FtQVqAjeOEH810H1KgDrcePb3OQT3HKziKAkOHVWBIAaFl3MWmNPCPoTUpiSfkZeu0UMREqQOuaQI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56ab40bb-b0b3-4542-0c7f-08ddc389782b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 10:22:15.2307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lk/Vr5AACsOKoml9OA/I3t9tmN+Lz5k2UKGffOpcHgF7NouJdHjGc9NCXupZdfFTShnclf74gVTrALlBh2GZ6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4471
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-15_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507150093
X-Proofpoint-GUID: 3tM8T_3ZJT1D6MJqR6tnVvsFwj6RzjAu
X-Authority-Analysis: v=2.4 cv=O6g5vA9W c=1 sm=1 tr=0 ts=68762bdb b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=N9fcl3qXH-Q2xw0pqSQA:9
X-Proofpoint-ORIG-GUID: 3tM8T_3ZJT1D6MJqR6tnVvsFwj6RzjAu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA5NCBTYWx0ZWRfX1fsUPzaXGjMD B/c8qCXOz13venjld4jq/jJlvwdse9lDfTRUd/FR4y0NvazVwfY1OqTDcXNs/qB53X81lm1s5n0 DUYYmqJM8HQ/VxoDNGtLQarmZIjosGucjV/Z/uegYa8S6kEPbqLQTaCyr9tKRy/dltumYPuap6i
 DGQO1MFRoVUyrUH4TcASmK8mO9umGI1LdFXvTLKbdJbIeKtMmcKlOMCm8WunvEnDAs+5RkeOH8k 1+sh080EluBKBLqxoJgX+AOs+Og+AD7LZ768rtsfpr8UHCiETwB7PJJRHTTfKJWBGDRXfNklJdh 93V6DHto3YA9oF522/MLFv3Pd5abqtPFZJqfeP+McIG4+yoZPKbyDnGhmTNEabhv5X4egxu02TF
 EzkvtJbtVu8w2BYg0X0vyQjhRwvSgU72SLAVyoqv/RjHfMmmwI/057QFPI6RBqkGRl2V9oHl

On 15 Jul 2025, Kris Van Hees verbalised:

> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

... aha, because the main package no longer ships anything in
%{_includedir}/dtrace any more, we do still want some package to own the
dir.

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

-- 
NULL && (void)
